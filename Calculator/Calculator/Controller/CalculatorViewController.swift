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
        guard let inputNumber = try? findNumber(of: sender),
              let currentNumber = numberLabel.text else {
            return
        }
        if (calculatorInput.isEmpty && inputNumber.contains("0")) ||
            (currentNumber.contains(".") && inputNumber == ".") {
            return
        }
        
        calculatorInput.append(inputNumber)
        
        if currentNumber == CalculatorConstant.defaultNumber,
           inputNumber != "." {
            numberLabel.text = inputNumber == "00" ? "0": inputNumber
            return
        }
        numberLabel.text?.append(inputNumber)
    }
    
    @IBAction func touchUpEqualButton(_ sender: UIButton) {
        addStack()

        do {
            let result = try ExpressionParser.parse(from: calculatorInput).result()
            
            if String(result).count > 20 {
                throw CalculatorError.unexpectedData
            }
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.maximumFractionDigits = 10
            numberLabel.text = numberFormatter.string(for: result)
            operatorLabel.text = ""
        } catch {
            operatorLabel.text = CalculatorConstant.defaultOperator
            numberLabel.text = CalculatorConstant.failedResult
        }
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard let inputOperator = try? findOperator(of: sender),
              let lastInput = calculatorInput.last else {
            return
        }
        
        if let _ = Int(String(lastInput)) {
            addStack()
        } else {
            calculatorInput.removeLast()
        }
        calculatorInput.append(inputOperator)
        
        operatorLabel.text = inputOperator
        numberLabel.text = CalculatorConstant.defaultNumber
    }
    
    @IBAction func touchUpFunctionButton(_ sender: UIButton) {
        try? findFunction(of: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = CalculatorConstant.defaultNumber
        operatorLabel.text = CalculatorConstant.defaultOperator
    }
    
    private func addStack() {
        guard let `operator` = operatorLabel.text,
              let number = numberLabel.text else {
            return
        }
        
        let stack = UIStackView()
        let operatorStackLabel = UILabel()
        let numberStackLabel = UILabel()
        
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fill
        stack.alignment = .fill
        
        numberStackLabel.textColor = .white
        operatorStackLabel.textColor = .white
        
        operatorStackLabel.text = `operator`
        numberStackLabel.text = number
        
        stack.addArrangedSubview(operatorStackLabel)
        stack.addArrangedSubview(numberStackLabel)
        
        stack.isHidden = true
        
        inputStackView.addArrangedSubview(stack)
        
        UIView.animate(withDuration: CalculatorConstant.actionDuration) {
            stack.isHidden = false
        }
        
        scrollView
            .setContentOffset(
                CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height),
                animated: true
            )
    }
    
    private func removeStack() {
        inputStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
        operatorLabel.text = CalculatorConstant.defaultOperator
        numberLabel.text = CalculatorConstant.defaultNumber
        calculatorInput = CalculatorConstant.defaultInput
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
    
    private func findFunction(of button: UIButton) throws {
        switch button {
        case acButton:
            removeStack()
        case ceButton:
            numberLabel.text = CalculatorConstant.defaultNumber
            removeLabelTextInCalculatorInput()
        case prefixButton:
            configurePrefix()
        default:
            throw CalculatorError.unexpectedData
        }
    }
    
    private func removeLabelTextInCalculatorInput() {
        guard var lastValue = calculatorInput.last else {
            return
        }
        while Int(String(lastValue)) != nil {
            _ = calculatorInput.popLast()
            lastValue = calculatorInput.last ?? " "
        }
    }
    
    private func configurePrefix() {
        guard let currentNumber = numberLabel.text,
              currentNumber != "0" else {
            return
        }
        
        if currentNumber.first == "+" {
            numberLabel.text?.removeFirst()
            numberLabel.text?.insert("-", at: currentNumber.startIndex)
        } else if currentNumber.first == "-" {
            numberLabel.text?.removeFirst()
            numberLabel.text?.insert("+", at: currentNumber.startIndex)
        } else {
            numberLabel.text = "-" + currentNumber
        }
        
        removeLabelTextInCalculatorInput()
        guard let number = numberLabel.text else {
            return
        }
        calculatorInput.append(number)
    }
}

