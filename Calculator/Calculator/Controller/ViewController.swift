//
//  Calculator - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

enum StringForm {
    case input
    case output
}

class ViewController: UIViewController {
    var expression = ""
    var `operator`: Operator?
    var operand = "0"
    var isOperatorActivated = false
    var errorHasOccured = false
    
    @IBOutlet var operatorLabel: UILabel!
    @IBOutlet var operandLabel: UILabel!
    @IBOutlet var logsStackView: UIStackView!
    
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
        operatorLog.font = .preferredFont(forTextStyle: .title3)
        operatorLog.textAlignment = .right
        operatorLog.adjustsFontForContentSizeCategory = true
        operatorLog.adjustsFontSizeToFitWidth = true
        operatorLog.minimumScaleFactor = 0.5
        
        if let `operator` = `operator` {
            operatorLog.text = String(`operator`.rawValue)
        } else {
            operatorLog.text = ""
        }
        
        operandLog.text = convertToInputForm(operand: operand)
        
        logStackView.addArrangedSubview(operatorLog)
        logStackView.addArrangedSubview(operandLog)
        
        stackView.addArrangedSubview(logStackView)
    }
    
    func updateExpression() {
        if let `operator` = `operator` {
            expression += String(`operator`.rawValue)
        }
        
        expression += operand
    }
    
    func updateOperatorLabel() {
        if let `operator` = `operator` {
            operatorLabel.text = String(`operator`.rawValue)
        } else {
            operatorLabel.text = ""
        }
    }
    
    func updateOperandLabel(form: StringForm) {
        switch form {
        case .input:
            operandLabel.text = convertToInputForm(operand: operand)
        case .output:
            operandLabel.text = convertToOutputForm(operand: operand)
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

    @IBAction func acButtonTouchedUP(_ sender: UIButton) {
        expression = ""
        `operator` = nil
        operand = "0"
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
        
        operand = "0"
        isOperatorActivated = false
        
        updateOperatorLabel()
        updateOperandLabel(form: .output)
    }
    
    @IBAction func signToggleButtonTouchedUp(_ sender: UIButton) {
        guard !errorHasOccured, Double(operand) != 0.0,
              let firstCharacterOfOperand = operand.first else {
            return
        }
        
        if firstCharacterOfOperand == "-" {
            operand = String(operand[operand.index(operand.startIndex, offsetBy: 1)...])
        } else {
            operand = "-" + operand
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
            operand = "0"
            isOperatorActivated = true
        }
        
        guard let operatorStringFromButton = sender.currentTitle else {
            return
        }
        
        `operator` = Operator(rawValue: Character(operatorStringFromButton))
        
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
            
            operand = String(result)
        } catch CalculateError.divisionByZero {
            operand = "NaN"
            errorHasOccured = true
        } catch {
            operand = "ERROR"
            errorHasOccured = true
        }
        
        expression = ""
        `operator` = nil
        isOperatorActivated = false
        
        updateOperatorLabel()
        updateOperandLabel(form: .output)
    }
    
    @IBAction func dotButtonTouchedUp(_ sender: UIButton) {
        guard !errorHasOccured, !operand.contains(".") else {
            return
        }
        
        isOperatorActivated = false
        
        operand += "."
        
        updateOperatorLabel()
        updateOperandLabel(form: .input)
    }
    
    @IBAction func numberButtonTouchedUp(_ sender: UIButton) {
        guard !errorHasOccured,
              let numberStringFromButton = sender.currentTitle,
              operand.countDigit() + numberStringFromButton.count <= 20 else {
            return
        }
        
        if operand == "0" {
            guard !numberStringFromButton.contains("0") else {
                return
            }
            
            operand = numberStringFromButton
        } else {
            operand += numberStringFromButton
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
