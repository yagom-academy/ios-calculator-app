//
//  CalculatorInternalAction.swift
//  Calculator
//
//  Created by Baek on 2022/06/01.
//

import Foundation

struct CalculatorInternalAction {
    //MARK: - Property
    private (set) var isOperandInputted = false
    private (set) var isCalculateCompleted = false
    private var inputtedFomula = CalculatorDefaultValue.fomula
    
    //MARK: - Main Method
    mutating func setDefaultValue() {
        isOperandInputted = false
        isCalculateCompleted = false
        inputtedFomula = CalculatorDefaultValue.fomula
    }
    
    func changeTheSign(_ text: String?) -> String {
        guard let operandText = text, Double(operandText) != 0.0,
              let operand = Double(filterSign(operandText, ",")) else {
            return CalculatorDefaultValue.operandLabel
        }
        
        return String((operand * -1).parse())
    }
    
    mutating func appendOperand(_ currentOperland: String?, _ title: String?) -> String {
        guard let tabNumber = title else {
            return CalculatorDefaultValue.operandLabel
        }
        
        let result = !isOperandInputted ? tabNumber : checkOperand(getText(currentOperland), with: tabNumber)
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
        inputtedFomula = CalculatorDefaultValue.fomula
        isCalculateCompleted = true
        
        do {
            let result = try fomula.result().parse()
            return result
        } catch {
            return CalculatorDefaultValue.error
        }
    }
    
    //MARK: - Sub Method
    private func filterSign(_ input: String, _ sign: String.Element) -> String {
        return input.filter { $0 != sign }
    }
    
    private func getText(_ optionalText: String?) -> String {
        guard let text = optionalText else { return "" }
        
        return text
    }
    
    private func checkOperand(_ currentlabel: String, with currentInput: String) -> String {
        if !currentlabel.contains("."), currentInput == "." {
            return currentlabel + currentInput
        } else if currentlabel.contains("."), currentInput.contains("0") {
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
        if inputtedFomula.isEmpty {
            inputtedFomula += " \(getText(currentOperator)) \(filterSign(getText(currentOperand), ","))"
        } else {
            inputtedFomula = "\(filterSign(getText(currentOperand), ","))"
        }
    }
}
