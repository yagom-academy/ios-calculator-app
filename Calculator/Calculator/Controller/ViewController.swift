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
        
//        numberFormatter.minimumFractionDigits = 0
        
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.numberStyle = .decimal
    }
    
    @IBAction func touchUpDigitButton(_ sender: UIButton) {
        guard let titleLabel = sender.titleLabel else {
            return
        }
        guard let titleLabelText = titleLabel.text else {
            return
        }
        switch sender {
        case dotButton:
            addDot(titleLabelText)
        default:
            addNumber(titleLabelText)
        }
    }
    @IBAction func touchUpChangingUIButton(_ sender: UIButton) {
            switch sender {
            case allClearButton:
                allClear()
            case clearEntryButton:
                clearEntry()
            default:
                changePostiveOrNegativeSymbol()
            }
        }
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard let titleLabel = sender.titleLabel else {
            return
        }
        guard let titleLabelText = titleLabel.text else {
            return
        }
        switch titleLabelText {
        case "+":
            pushOperator(.addition)
        case "−":
            pushOperator(.subtraction)
        case "×":
            pushOperator(.mulitplication)
        case "÷":
            pushOperator(.division)
        default:
           performCalculation()
        }
    }
}
// MARK : --- Perform functions
extension ViewController {
    func addDot(_ dot: String) {
        guard let currentText = userInputDigitsLabel.text else {
            return
        }
        guard !currentText.contains(dot) else {
            return
        }
        updateUIDigitsLabel(currentText + dot)
    }
    func addNumber(_ digit: String) {
        guard let currentText = userInputDigitsLabel.text else {
            return
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
    func changePostiveOrNegativeSymbol() {
        guard var currentText = userInputDigitsLabel.text else {
            return
        }
        guard let firstItem = currentText.first,
              firstItem != "N" else {
            return
        }
        guard let doubleNumber = Double(currentText),
              doubleNumber != 0 else {
            return
        }

        if firstItem == "-" {
            currentText.removeFirst()
            updateUIDigitsLabel(currentText)
        } else {
            updateUIDigitsLabel("-" + currentText)
        }
    }
    
    func pushOperator(_ type: OperatorType) {
        guard let currentText = userInputDigitsLabel.text else {
            return
        }
        guard let doubleNumber = Double(currentText) else {
            return
        }
        if userInputOperatorLabel.text == "" {
            removeSubview()
        }
        
        if let lastOperator = calculator.infixLastOperatorItem() {
            addSubview(operand: currentText, operator: lastOperator.type.description)
        } else {
            addSubview(operand: currentText, operator: "")
        }
        
        if doubleNumber != 0 {
            calculator.enqueBehindNumberOrOperator(Operand(value: doubleNumber))
            calculator.enqueBehindNumberOrOperator(Operator(type: type))
            updateUIDigitsLabel()
        }
        updateUIOperatorLabel(type.description)
    }
    func performCalculation() {
        guard let currentText = userInputDigitsLabel.text else {
            return
        }
        guard let doubleNumber = Double(currentText) else {
            return
        }
        guard let currentOperator = userInputOperatorLabel.text,
              currentOperator != "" else {
            return
        }
        
        calculator.dequeBehind()
        switch currentOperator {
        case "+":
            calculator.enqueBehindNumberOrOperator(Operator(type: .addition))
        case "−":
            calculator.enqueBehindNumberOrOperator(Operator(type: .subtraction))
        case "×":
            calculator.enqueBehindNumberOrOperator(Operator(type: .mulitplication))
        case "÷":
            calculator.enqueBehindNumberOrOperator(Operator(type: .division))
        default:
           break
        }
        calculator.enqueBehindNumberOrOperator(Operand(value: doubleNumber))
        do {
            let result = try calculator.makeCalculation()
            guard let convertedResult = numberFormatter.string(from: NSNumber(value: result)) else {
                return
            }
            updateUIDigitsLabel(convertedResult)
        } catch CalculatorError.zeroDivisor {
            updateUIDigitsLabel("NaN")
        } catch {
            
        }
        updateUIOperatorLabel()
        addSubview(operand: currentText, operator: currentOperator)
    }
}
// MARK : --- Update UI Funtions
extension ViewController {
    func addSubview(operand: String, operator: String) {
        let subview = UIStackView()
        let operatorLabel = UILabel()
        let operandLabel = UILabel()
        
        operatorLabel.text = operand
        operatorLabel.textColor = .white
        operandLabel.text = `operator`
        operandLabel.textColor = .white
        
        subview.addArrangedSubview(operandLabel)
        subview.addArrangedSubview(operatorLabel)
        
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
