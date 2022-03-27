//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

fileprivate enum CalculatorConstant {
    static let defaultNumber: String = "0"
    static let defaultOperator: String = ""
    static let defaultInput: String = ""
    
    static let failedResult = "NaN"
    
    static let actionDuration: Double = 0.3
}

final class CalculatorViewController: UIViewController {
    private var calculatorInput: String = CalculatorConstant.defaultInput

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var inputStackView: UIStackView!
    
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var ceButton: UIButton!
    @IBOutlet weak var prefixButton: UIButton!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var devideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    
    @IBOutlet weak var dotButton: UIButton!
    
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var doubleZeroButton: UIButton!
    
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        guard let inputNumber = try? findNumber(of: sender) else {
            return
        }
        if isValidNumber(inputNumber: inputNumber) == false {
            return
        }
        
        calculatorInput.append(inputNumber)
        updateNumberLabel(with: inputNumber)
    }
    
    @IBAction func touchUpEqualButton(_ sender: UIButton) {
        addInputStack()
        calculate()
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard let inputOperator = try? findOperator(of: sender),
              let lastInput = calculatorInput.last else {
            return
        }
        
        if let _ = Int(String(lastInput)) {
            addInputStack()
        } else {
            calculatorInput.removeLast()
        }
        calculatorInput.append(inputOperator)
        setLabelsText(inputOperator: inputOperator)
    }
    
    @IBAction func touchUpFunctionButton(_ sender: UIButton) {
        try? findFunction(of: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelsText()
    }
    
    private func findNumber(of button: UIButton) throws -> String {
        switch button {
        case dotButton:
            return "."
        case zeroButton:
            return "0"
        case doubleZeroButton:
            return "00"
        case oneButton:
            return "1"
        case twoButton:
            return "2"
        case threeButton:
            return "3"
        case fourButton:
            return "4"
        case fiveButton:
            return "5"
        case sixButton:
            return "6"
        case sevenButton:
            return "7"
        case eightButton:
            return "8"
        case nineButton:
            return "9"
        default:
            throw CalculatorError.unexpectedData
        }
    }
    
    private func isValidNumber(inputNumber: String) -> Bool {
        guard let currentNumber = numberLabel.text else {
            return false
        }
        if (calculatorInput.isEmpty && inputNumber.contains("0")) ||
            (currentNumber.contains(".") && inputNumber == ".") {
            return false
        }
        return true
    }
    
    private func updateNumberLabel(with inputNumber: String) {
        guard let currentNumber = numberLabel.text else {
            return
        }
        if currentNumber == CalculatorConstant.defaultNumber,
           inputNumber != "." {
            numberLabel.text = inputNumber == "00" ? "0": inputNumber
            return
        }
        numberLabel.text?.append(inputNumber)
    }
    
    private func addInputStack() {
        guard let stack = generateStack() else {
            return
        }
        
        inputStackView.addArrangedSubview(stack)
        setAnimation(of: stack)
        setScrollViewLayout()
    }
    
    private func generateStack() -> UIStackView? {
        guard let (operatorStackLabel, numberStackLabel) = generateStackLabels() else {
            return nil
        }
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fill
        stack.alignment = .fill
        
        stack.addArrangedSubview(operatorStackLabel)
        stack.addArrangedSubview(numberStackLabel)
        
        return stack
    }
    
    private func generateStackLabels() -> (UILabel, UILabel)? {
        guard let `operator` = operatorLabel.text,
              let number = numberLabel.text else {
            return nil
        }
        let operatorStackLabel = UILabel()
        let numberStackLabel = UILabel()
        
        operatorStackLabel.textColor = .white
        operatorStackLabel.text = `operator`
        
        numberStackLabel.textColor = .white
        numberStackLabel.text = number
        
        return (operatorStackLabel, numberStackLabel)
    }
    
    private func setAnimation(of stack: UIStackView) {
        stack.isHidden = true
        UIView.animate(withDuration: CalculatorConstant.actionDuration) {
            stack.isHidden = false
        }
    }
    
    private func setScrollViewLayout() {
        scrollView
            .setContentOffset(
                CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height),
                animated: true
            )
    }
    
    private func calculate() {
        do {
            let result = try ExpressionParser.parse(from: calculatorInput).result()
            guard let processedNumber = NumberFormatter.calculator.string(for: result) else {
                return
            }
            
            setLabelsText(inputNumber: processedNumber)
        } catch {
            setLabelsText()
        }
    }
    
    private func findOperator(of button: UIButton) throws -> String {
        switch button {
        case addButton:
            return String(Operator.add.rawValue)
        case subtractButton:
            return String(Operator.subtract.rawValue)
        case devideButton:
            return String(Operator.devide.rawValue)
        case multiplyButton:
            return String(Operator.multiply.rawValue)
        default:
            throw CalculatorError.unexpectedData
        }
    }
    
    private func setLabelsText(inputOperator: String = CalculatorConstant.defaultOperator,
                              inputNumber: String = CalculatorConstant.defaultNumber) {
        operatorLabel.text = inputOperator
        numberLabel.text = inputNumber
    }
    
    private func findFunction(of button: UIButton) throws {
        switch button {
        case acButton:
            removeStack()
        case ceButton:
            removeLabelText()
        case prefixButton:
            configurePrefix()
        default:
            throw CalculatorError.unexpectedData
        }
    }
    
    private func removeStack() {
        inputStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
        setLabelsText()
        calculatorInput = CalculatorConstant.defaultInput
    }
    
    private func removeLabelText() {
        guard let numberCount = numberLabel.text?.count else {
            return
        }
        calculatorInput.removeLast(numberCount)
        numberLabel.text = CalculatorConstant.defaultNumber
    }
    
    private func configurePrefix() {
        guard var currentNumber = numberLabel.text,
              currentNumber != "0",
              let firstNumber = currentNumber.first else {
            return
        }
        let newPrefix: String
        
        calculatorInput.removeLast(currentNumber.count)
        switch firstNumber {
        case let currentPrefix where "+-".contains(currentPrefix):
            currentNumber.removeFirst()
            newPrefix = currentPrefix == "+" ? "-" : "+"
        default:
            newPrefix = "-"
        }
        
        let newNumber: String = newPrefix + currentNumber
        
        numberLabel.text = newNumber
        calculatorInput.append(newNumber)
    }
}

