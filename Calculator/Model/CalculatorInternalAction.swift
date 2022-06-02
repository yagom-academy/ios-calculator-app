//
//  CalculatorInternalAction.swift
//  Calculator
//
//  Created by Baek on 2022/06/01.
//

import Foundation

struct CalculatorInternalAction {
    private (set) var isOperandInputted = false
    private (set) var isCalculateCompleted = false
    private var inputtedFomula = CalculatorDefaultValue.fomula
    
    mutating func setDefaultValue() {
        isOperandInputted = false
        isCalculateCompleted = false
        inputtedFomula = CalculatorDefaultValue.fomula
    }
    
    func changeTheSign(_ text: String?) -> String {
        guard let operandText = text, Double(operandText) != 0.0 else {
            return CalculatorDefaultValue.operandLabel
        }
        guard let operand = Double(filterSign(operandText, ",")) else {
            return CalculatorDefaultValue.operandLabel
        }
        
        return String((operand * -1).parse())
    }
    
    mutating func appendOperand(_ currentOperland: String?, _ title: String?) -> String {
        guard let tabNumber = title else {
            return CalculatorDefaultValue.operandLabel
        }
        
        var result = ""
        
        if !isOperandInputted {
            result = tabNumber
        } else {
            result = checkOperand(getText(currentOperland), with: tabNumber)
        }
        
        isOperandInputted = true
        
        return result
    }
    
    mutating func appendFormula(_ currentOperand: String?, _ currentOperator: String?) -> (currentOperand: String, currentOperator: String) {
        guard let `operator` = currentOperator else {
            return (getText(currentOperand), CalculatorDefaultValue.operatorLabel)
        }
        
        addInputtedFomula(currentOperand, currentOperator)
        isOperandInputted = false
        
        return (getText(currentOperand), `operator`)
    }
    
    mutating func calculate() -> String? {
        var fomula = ExpressionParser.parse(from: inputtedFomula)
        
        do {
            let result = try fomula.result().parse()
            isCalculateCompleted = true
            return result
        } catch {
            return CalculatorDefaultValue.error
        }
    }
    
    private func filterSign(_ input: String, _ sign: String.Element) -> String {
        return input.filter { $0 != sign }
    }
    
    private func getText(_ optionalText: String?) -> String {
        guard let text = optionalText else { return "" }
        
        return text
    }
    
    private func checkOperand(_ currentlabel: String, with currentInput: String) -> String {
        if !currentlabel.contains(".") && currentInput == "." {
            return currentlabel + currentInput
        } else if currentlabel.contains(".") && currentInput.contains("0") {
            return currentlabel + currentInput
        } else {
            return changeFormat(currentlabel + currentInput)
        }
    }
    
    private func changeFormat(_ input: String) -> String {
        let result = filterSign(input, ",")
        
        return (Double(result) ?? 0).parse()
    }
    
    private mutating func addInputtedFomula(_ currentOperand: String?, _ currentOperator: String?) {
        guard inputtedFomula.isEmpty else {
            inputtedFomula += " \(getText(currentOperator)) \(filterSign(getText(currentOperand), ","))"
            return
        }
        
        inputtedFomula = "\(filterSign(getText(currentOperand), ","))"
    }
}
