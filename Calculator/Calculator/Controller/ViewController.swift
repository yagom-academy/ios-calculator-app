//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userInputDigitsLabel: UILabel!
    @IBOutlet weak var userInputOperatorLabel: UILabel!
    
    @IBOutlet weak var dotButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    @IBOutlet weak var allClearButton: UIButton!
    @IBOutlet weak var clearEntryButton: UIButton!    
    
    @IBOutlet weak var scrollStackView: UIStackView!
    
    var calculator = Calculator()
    let numberFormatter = NumberFormatter()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.numberStyle = .decimal
    }
    
    @IBAction func touchUpDigitButton(_ sender: UIButton)  {
        guard let titleLabel = sender.titleLabel else {
            return
        }
        guard let titleLabelText = titleLabel.text else {
            return
        }
        do {
            switch sender {
            case dotButton:
                try addDot(titleLabelText)
            default:
                try addNumber(titleLabelText)
            }
        } catch {
            print("unExpectedError : \(error)")
        }
    }
    @IBAction func touchUpChangingUIButton(_ sender: UIButton) {
            switch sender {
            case allClearButton:
                allClear()
            case clearEntryButton:
                clearEntry()
            default:
                do {
                    try changePostiveOrNegativeSymbol()
                } catch {
                    print("unExpectedError : \(error)")
                }
            }
        }
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard let titleLabel = sender.titleLabel else {
            return
        }
        guard let titleLabelText = titleLabel.text else {
            return
        }
        do {
            switch titleLabelText {
            case "+":
                try pushOperator(.addition)
            case "−":
                try pushOperator(.subtraction)
            case "×":
                try pushOperator(.mulitplication)
            case "÷":
                try pushOperator(.division)
            default:
                try performCalculation()
            }
        } catch {
            print("unExpectedError : \(error)")
        }
    }
}
// MARK : --- Perform functions
extension ViewController {
    func addDot(_ dot: String) throws {
        guard let currentText = userInputDigitsLabel.text else {
            throw CalculatorViewControllerError.emptyUIDigitsLabel
        }
        guard !currentText.contains(dot) else {
            throw CalculatorViewControllerError.alreadyHaveADot
        }
        updateUIDigitsLabel(currentText + dot)
    }
    func addNumber(_ digit: String) throws {
        guard let currentText = userInputDigitsLabel.text else {
            throw CalculatorViewControllerError.emptyUIDigitsLabel
        }
        let text = (digit == "00" ? "0" : digit)
        if currentText == "0" || currentText == "NaN" {
            updateUIDigitsLabel(text)
        } else {
            updateUIDigitsLabel(currentText + digit)
        }
    }
    
    func allClear() {
        calculator.removeAllInfix()
        updateUIDigitsLabel()
        updateUIOperatorLabel()
        removeSubview()
    }
    func clearEntry() {
        updateUIDigitsLabel()
    }
    func changePostiveOrNegativeSymbol() throws {
        guard var currentText = userInputDigitsLabel.text else {
            throw CalculatorViewControllerError.emptyUIDigitsLabel
        }
        guard let firstItem = currentText.first,
              firstItem != "N" else {
            throw CalculatorViewControllerError.couldNotChangeSymbolCauseNaN
        }
        guard let doubleNumber = Double(currentText),
              doubleNumber != 0 else {
            throw CalculatorViewControllerError.couldNotChangeSymbolCauseZero
        }

        if firstItem == "-" {
            currentText.removeFirst()
            updateUIDigitsLabel(currentText)
        } else {
            updateUIDigitsLabel("-" + currentText)
        }
    }
    
    func pushOperator(_ type: OperatorType) throws {
        guard let currentText = userInputDigitsLabel.text else {
            throw CalculatorViewControllerError.emptyUIDigitsLabel
        }
        guard let doubleNumber = Double(currentText) else {
            throw CalculatorViewControllerError.couldNotConvertToDouble
        }
        
        if userInputOperatorLabel.text == "" {
            removeSubview()
        }
        
        if let lastOperator = calculator.getLastOperatorItemFromInfix() {
            addSubview(operand: currentText, operator: lastOperator.type.description)
        } else {
            addSubview(operand: currentText, operator: "")
        }
        calculator.enqueueBehindNumberOrOperator(Operand(value: doubleNumber))
        calculator.enqueueBehindNumberOrOperator(Operator(type: type))
        updateUIDigitsLabel()
        updateUIOperatorLabel(type.description)
    }
    func performCalculation() throws {
        guard let currentText = userInputDigitsLabel.text else {
            throw CalculatorViewControllerError.emptyUIDigitsLabel
        }
        guard let doubleNumber = Double(currentText) else {
            throw CalculatorViewControllerError.couldNotConvertToDouble
        }
        guard let currentOperator = userInputOperatorLabel.text,
              currentOperator != "" else {
            throw CalculatorViewControllerError.alreadyPerformedCalculation
        }
        
        calculator.dequeueBehind()
        
        switch currentOperator {
        case "+":
            calculator.enqueueBehindNumberOrOperator(Operator(type: .addition))
        case "−":
            calculator.enqueueBehindNumberOrOperator(Operator(type: .subtraction))
        case "×":
            calculator.enqueueBehindNumberOrOperator(Operator(type: .mulitplication))
        case "÷":
            calculator.enqueueBehindNumberOrOperator(Operator(type: .division))
        default:
           break
        }
        calculator.enqueueBehindNumberOrOperator(Operand(value: doubleNumber))
        do {
            let result = try calculator.makeCalculation()
            let resultNSNumber = NSNumber(value: result)
            guard let convertedResult = numberFormatter.string(from: resultNSNumber) else {
                throw CalculatorViewControllerError.couldNotConvertToStringFromNumberFormatter
            }
            updateUIDigitsLabel(convertedResult)
        } catch CalculatorError.zeroDivisor {
            updateUIDigitsLabel("NaN")
            print("expectedError : \(CalculatorError.zeroDivisor)")
        } catch {
            print("unExpectedError : \(error)")
        }
        updateUIOperatorLabel()
        addSubview(operand: currentText, operator: currentOperator)
    }
}
// MARK : --- Update UI Funtions
extension ViewController {
    func addSubview(operand: String, operator: String) {
        var checkHavingDotOperand = operand
        if let last = checkHavingDotOperand.last,
           last == "." {
            checkHavingDotOperand.removeLast()
        }
        let subview = UIStackView()
        let operandLabel = UILabel()
        let operatorLabel = UILabel()
        
        operandLabel.text = `operator`
        operandLabel.textColor = .white
        operatorLabel.text = checkHavingDotOperand
        operatorLabel.textColor = .white
        
        subview.addArrangedSubview(operandLabel)
        subview.addArrangedSubview(operatorLabel)
        subview.spacing = 4.0
        scrollStackView.addArrangedSubview(subview)
    }
    func removeSubview() {
        for subview in scrollStackView.arrangedSubviews {
            subview.removeFromSuperview()
        }
    }
    func updateUIDigitsLabel(_ text: String = "0") {
        userInputDigitsLabel.text = text
    }
    func updateUIOperatorLabel(_ text: String = "") {
        userInputOperatorLabel.text = text
    }
}
