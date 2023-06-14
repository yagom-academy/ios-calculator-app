//
//  OperationManager.swift
//  Calculator
//
//  Created by Erick on 2023/06/11.
//

import Foundation

typealias LabelValues = (operandValue: String, operatorValue: String)

struct OperationManager {
    private var formula: String = CalculatorNamespace.empty
    private var isCalculate: Bool = false
    
    mutating func calculateFormula() -> String {
        var parsedFormula = ExpressionParser.parse(from: formula)
        let result = OperandFormatter.formatStringOperand(String(parsedFormula.result()))
        isCalculate = true
        clearFormula()
        
        return result
    }

    mutating func addFormula(_ operators: String, _ operands: String)  {
        let operands = OperandFormatter.formatStringOperand(operands)
        
        if formula.isEmpty && operands != CalculatorNamespace.zero  {
            formula += "\(operands)"
        } else if operands != CalculatorNamespace.zero {
            formula += "\(operators)\(operands)"
        }
        
        if operands == CalculatorNamespace.zero {
            formula += "\(operators)\(operands)"
        }
    }
    
    mutating func addOperandsLabel(_ currentOperands: String, _ inputOperands: String) -> String {
        let numberOperands = isCalculate ? CalculatorNamespace.zero : currentOperands
        let operands = OperandFormatter.formatStringOperand(numberOperands + inputOperands)
        isCalculate = false
        
        if operands.filter({ $0 == "," }).count == 4 || numberOperands.count >= 13 {
            return currentOperands
        }
        
        if numberOperands.contains(CalculatorNamespace.dot) &&
            (inputOperands == CalculatorNamespace.zero || inputOperands == CalculatorNamespace.doubleZero) {
            let result = numberOperands + inputOperands
            return result
        } else if !numberOperands.contains(CalculatorNamespace.dot) &&
                    inputOperands == CalculatorNamespace.dot {
            let result = operands + inputOperands
            return result
        }

        return operands
    }
    
    func changeSign(_ operands: String) -> String {
        var operands = operands
        guard operands != CalculatorNamespace.zero else { return CalculatorNamespace.zero }
        
        if operands.contains(CalculatorNamespace.negative) {
            operands.removeFirst()
        } else {
            operands.insert(Character(CalculatorNamespace.negative), at: operands.startIndex)
        }
        
        return operands
    }
    
    mutating func clearFormula() {
        formula = CalculatorNamespace.empty
    }
}
