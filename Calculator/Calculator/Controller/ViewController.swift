//
//  Calculator - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

final class CalculateViewController: UIViewController {
    enum StringForm {
        case input
        case output
    }
    
    private var expression = ""
    private var calculatorOperator: Operator?
    private var calculatorOperand = "0"
    private var isOperatorActivated = false
    private var errorHasOccured = false
    
    @IBOutlet private var operatorLabel: UILabel!
    @IBOutlet private var operandLabel: UILabel!
    @IBOutlet private var logsStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        removeAllFromStackView(stackView: logsStackView)
        
        updateOperatorLabel()
        updateOperandLabel(form: .output)
    }
    
    func removeAllFromStackView(stackView: UIStackView) {
        stackView.arrangedSubviews
            .forEach {
                logsStackView.removeArrangedSubview($0)
                $0.removeFromSuperview()
            }
    }
    
    func addLogToStackView(stackView: UIStackView) {
        let logStackView = UIStackView()
        logStackView.axis = .horizontal
        logStackView.spacing = 8
        
        let operatorLog = UILabel()
        operatorLog.textColor = .white
        operatorLog.font = .preferredFont(forTextStyle: .title3)
        operatorLog.textAlignment = .right
        operatorLog.adjustsFontForContentSizeCategory = true
        operatorLog.adjustsFontSizeToFitWidth = true
        operatorLog.minimumScaleFactor = 0.5
        
        let operandLog = UILabel()
        operandLog.textColor = .white
        operandLog.font = .preferredFont(forTextStyle: .title3)
        operandLog.textAlignment = .right
        operandLog.adjustsFontForContentSizeCategory = true
        operandLog.adjustsFontSizeToFitWidth = true
        operandLog.minimumScaleFactor = 0.5
        
        if let calculatorOperator = calculatorOperator {
            operatorLog.text = String(calculatorOperator.rawValue)
        } else {
            operatorLog.text = ""
        }
        
        operandLog.text = convertToInputForm(operand: calculatorOperand)
        
        logStackView.addArrangedSubview(operatorLog)
        logStackView.addArrangedSubview(operandLog)
        
        stackView.addArrangedSubview(logStackView)
    }
    
    func updateExpression() {
        if let calculatorOperator {
            expression += String(calculatorOperator.rawValue)
        }
        
        expression += calculatorOperand
    }
    
    func updateOperatorLabel() {
        if let calculatorOperator {
            operatorLabel.text = String(calculatorOperator.rawValue)
        } else {
            operatorLabel.text = ""
        }
    }
    
    func updateOperandLabel(form: StringForm) {
        switch form {
        case .input:
            operandLabel.text = convertToInputForm(operand: calculatorOperand)
        case .output:
            operandLabel.text = convertToOutputForm(operand: calculatorOperand)
        }
    }
    
    func convertToInputForm(operand: String) -> String {
        if let firstIndexOfDot = operand.firstIndex(of: ".") {
            let integer = String(operand[..<firstIndexOfDot])
            let fraction = String(operand[operand.index(firstIndexOfDot, offsetBy: 1)...])
            
            let formattedInteger = integer.toFormattedString(style: .decimal)
            
            if fraction == "" {
                return formattedInteger + "."
            } else {
                return formattedInteger + "." + fraction
            }
        } else {
            let formattedOperand = operand.toFormattedString(style: .decimal)
            
            return formattedOperand
        }
    }
    
    func convertToOutputForm(operand: String) -> String {
        let formattedOperand = operand.toFormattedString(style: .decimal)
        
        return formattedOperand
    }

    @IBAction func acButtonTouchedUp(_ sender: UIButton) {
        expression = ""
        calculatorOperator = nil
        calculatorOperand = "0"
        isOperatorActivated = false
        errorHasOccured = false
        
        removeAllFromStackView(stackView: logsStackView)
        
        updateOperatorLabel()
        updateOperandLabel(form: .output)
    }
    
    @IBAction func ceButtonTouchedUp(_ sender: UIButton) {
        guard !errorHasOccured else {
            return
        }
        
        calculatorOperand = "0"
        isOperatorActivated = false
        
        updateOperatorLabel()
        updateOperandLabel(form: .output)
    }
    
    @IBAction func signToggleButtonTouchedUp(_ sender: UIButton) {
        guard !errorHasOccured, Double(calculatorOperand) != 0.0,
              let firstCharacterOfOperand = calculatorOperand.first else {
            return
        }
        
        if firstCharacterOfOperand == "-" {
            calculatorOperand = String(calculatorOperand[calculatorOperand.index(calculatorOperand.startIndex, offsetBy: 1)...])
        } else {
            calculatorOperand = "-" + calculatorOperand
        }
        
        updateOperatorLabel()
        updateOperandLabel(form: .input)
    }
    
    @IBAction func operatorButtonTouchedUp(_ sender: UIButton) {
        guard !errorHasOccured else {
            return
        }
        
        if !isOperatorActivated {
            updateExpression()
            addLogToStackView(stackView: logsStackView)
            calculatorOperand = "0"
            isOperatorActivated = true
        }
        
        guard let operatorStringFromButton = sender.currentTitle else {
            return
        }
        
        calculatorOperator = Operator(rawValue: Character(operatorStringFromButton))
        
        updateOperatorLabel()
        updateOperandLabel(form: .output)
    }
    
    @IBAction func calculateButtonTouchedUp(_ sender: UIButton) {
        guard !errorHasOccured else {
            return
        }
        
        updateExpression()
        addLogToStackView(stackView: logsStackView)
        
        do {
            var formula = ExpressionParser.parse(from: expression)
            let result = try formula.result()
            
            calculatorOperand = String(result)
        } catch CalculateError.divisionByZero {
            calculatorOperand = "NaN"
            errorHasOccured = true
        } catch {
            calculatorOperand = "ERROR"
            errorHasOccured = true
        }
        
        expression = ""
        calculatorOperator = nil
        isOperatorActivated = false
        
        updateOperatorLabel()
        updateOperandLabel(form: .output)
    }
    
    @IBAction func dotButtonTouchedUp(_ sender: UIButton) {
        guard !errorHasOccured, !calculatorOperand.contains(".") else {
            return
        }
        
        isOperatorActivated = false
        
        calculatorOperand += "."
        
        updateOperatorLabel()
        updateOperandLabel(form: .input)
    }
    
    @IBAction func numberButtonTouchedUp(_ sender: UIButton) {
        guard !errorHasOccured,
              let numberStringFromButton = sender.currentTitle,
              calculatorOperand.countDigit() + numberStringFromButton.count <= 20 else {
            return
        }
        
        if calculatorOperand == "0" {
            guard !numberStringFromButton.contains("0") else {
                return
            }
            
            calculatorOperand = numberStringFromButton
        } else {
            calculatorOperand += numberStringFromButton
        }
        
        isOperatorActivated = false
        
        updateOperatorLabel()
        updateOperandLabel(form: .input)
    }
}

fileprivate extension String {
    func toFormattedString(style: NumberFormatter.Style) -> String {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.usesSignificantDigits = true
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.numberStyle = style
        
        guard let formattedString = numberFormatter.string(for: Double(self)) else {
            return self
        }
        
        return formattedString
    }
    
    func countDigit() -> Int {
        guard let _ = Double(self) else {
            return 0
        }
        
        return self.filter { $0 != "." }.count
    }
}
