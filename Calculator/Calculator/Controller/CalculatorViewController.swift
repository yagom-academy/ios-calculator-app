//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    // MARK: IBOutlet
    @IBOutlet private weak var currentOperandLabel: UILabel!
    @IBOutlet private weak var currentOperatorLabel: UILabel!
    
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var doubleZeroButton: UIButton!
    @IBOutlet weak var decimalPointButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!

    @IBOutlet private weak var resultButton: UIButton!
    @IBOutlet private weak var convertingSignButton: UIButton!

    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var formulaStackView: UIStackView!
    
    private var stringToParse: String = ""
    private var isFirstOperand: Bool = true
    private var isOperandEntered: Bool = false
    private var isResultButtonDidTouch: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp() {
        stringToParse = ""
        isFirstOperand = true
        isOperandEntered = false
        isResultButtonDidTouch = false
        currentOperandLabel.text = Number.zero.rawValue
        currentOperatorLabel.text = ""
    }
    
    // MARK: Operand Button Method
    @IBAction private func operandButtonsDidTouch(_ sender: UIButton) {
        guard var validOperand = checkValidity(of: sender) else { return }
        
        Number.allCases.forEach { number in
            guard let buttonString = sender.titleLabel?.text else { return }
            
            if buttonString == number.rawValue {
                validOperand += number.rawValue
            } else if buttonString == Number.doubleZero.rawValue, number == .doubleZero {
                validOperand += Number.doubleZero.rawValue
            } else if buttonString == Number.decimalPoint.rawValue, number == .decimalPoint {
                validOperand += Number.decimalPoint.rawValue
            }
        }
        
        isOperandEntered = true
        currentOperandLabel.text = returnNumberDividedByComma(from: validOperand)
    }
    
    // MARK: Operator Button Methods
    @IBAction private func operatorButtonsDidTouch(_ sender: UIButton) {
        if isResultButtonDidTouch == true {
            isOperandEntered = false
            currentOperandLabel.text = Number.zero.rawValue
            currentOperatorLabel.text = sender.titleLabel?.text
            isResultButtonDidTouch = false
        }
        
        guard isOperandEntered == true else { return }
        
        checkAndAddLabelToStackView()
        currentOperatorLabel.text = sender.titleLabel?.text
        currentOperandLabel.text = Number.zero.rawValue
        isOperandEntered = false
    }
    
    @IBAction private func resultButtonDidTouch(_ sender: UIButton) {
        guard let operatorString = currentOperatorLabel.text else { return }
        guard !operatorString.isEmpty else { return }
        guard formulaStackView.arrangedSubviews.last != nil else { return }
        
        checkAndAddLabelToStackView()
        tryToReturnResult()
        isResultButtonDidTouch = true
    }
    
    // MARK: Extra Button Methods
    @IBAction private func allClearButtonDidTouch(_ sender: UIButton) {
        currentOperandLabel.text = Number.zero.rawValue
        currentOperatorLabel.text = ""
        
        guard formulaStackView.arrangedSubviews.last != nil else { return }
        
        for view in formulaStackView.arrangedSubviews {
            view.removeFromSuperview()
        }
        
        setUp()
    }
    
    @IBAction private func clearEntryButtonDidTouch(_ sender: UIButton) {
        currentOperandLabel.text = Number.zero.rawValue
    }
    
    @IBAction private func signConvertingButtonDidTouch(_ sender: UIButton) {
        guard var currentNumber = currentOperandLabel.text else { return }
        guard currentNumber != Number.zero.rawValue else { return }
        
        if currentNumber.contains(Operator.subtract.rawValue) {
            let minusSign = currentNumber.first
            currentNumber = currentNumber.filter{ $0 != minusSign }
        } else {
            currentNumber = String(Operator.subtract.rawValue) + currentNumber
        }
        
        currentOperandLabel.text = currentNumber
    }
    
    // MARK: StackView Related Method
    private func checkAndAddLabelToStackView() {
        let label = UILabel()
        
        guard let operatorLabelText = currentOperatorLabel.text else { return }
        guard var operandLabelText = currentOperandLabel.text else { return }
        
        while operandLabelText.contains(Number.decimalPoint.rawValue)
                && operandLabelText.hasSuffix(Number.zero.rawValue) {
            operandLabelText.removeLast()
        }
        
        if operandLabelText.hasSuffix(Number.decimalPoint.rawValue) {
            operandLabelText.removeLast()
        }
        
        addLabelToStackView(label, operandLabelText, operatorLabelText)
    }
    
    // MARK: Function-Separated Method
    private func returnNumberDividedByComma(from currentOperand: String) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 19
        
        guard currentOperand.contains(".") == false || currentOperand.last != "0" else {
            return currentOperand
        }
        
        let commaDeletedOperand = currentOperand.filter { $0 != "," }
        
        if commaDeletedOperand.hasSuffix(Number.decimalPoint.rawValue) {
            return currentOperand
        } else {
            guard let doubledCurrentOperand = Double(commaDeletedOperand) else { return nil }
            let number = NSNumber(value: doubledCurrentOperand)
            guard let formattedNumber = numberFormatter.string(from: number) else { return nil }
            
            return formattedNumber
        }
    }
    
    private func tryToReturnResult() {
        let formulaForResult = ExpressionParser.parse(from: stringToParse)
        var myFormula = formulaForResult
        
        do {
            guard let result = try myFormula.result() else { return }
            currentOperandLabel.text = checkIfDecimalPointIsNeeded(result)
        } catch CalculatorError.divisionByZero {
            currentOperandLabel.text = "NaN"
        } catch {}
        
        currentOperatorLabel.text = ""
    }
    
    private func checkValidity(of sender: UIButton) -> String? {
        guard let buttonString = sender.titleLabel?.text else { return nil }
        guard var currentOperand = currentOperandLabel.text else { return nil }
        guard currentOperand.filter({ $0 != "," }).count < 20 else { return nil }
        guard currentOperand != Number.zero.rawValue || buttonString != "\(Number.doubleZero.rawValue)" else { return nil }
        
        if currentOperand == Number.zero.rawValue, buttonString != "\(Number.decimalPoint.rawValue)" {
            currentOperand = ""
        } else if currentOperand.hasPrefix("-\(Number.zero.rawValue)") {
            currentOperand = "-"
        }
        
        return currentOperand
    }
    
    private func addLabelToStackView(_ label: UILabel, _ operandLabelText: String, _ operatorLabelText: String) {
        if isFirstOperand == true {
            label.text = "\(operandLabelText) "
            label.textColor = .white
            formulaStackView.addArrangedSubview(label)
            isFirstOperand = false
        } else {
            label.text = "\(operatorLabelText) \(operandLabelText) "
            label.textColor = .white
            formulaStackView.addArrangedSubview(label)
        }
        
        guard let string = label.text?.filter({ $0 != "," }) else { return }
        
        stringToParse.append(string)
        scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height), animated: false)
    }
    
    private func checkIfDecimalPointIsNeeded(_ result: Double) -> String? {
        var resultString: String

        if floor(result) == result {
            resultString = String(format:"%.0f", result)
        } else {
            resultString = String(result)
        }
        
        return returnNumberDividedByComma(from: resultString)
    }
}

