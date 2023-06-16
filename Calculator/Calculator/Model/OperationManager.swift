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
        isCalculate = true
        clearFormula()
        
        return OperandFormatter.formatStringOperand(String(parsedFormula.result()))
    }

    @discardableResult
    mutating func addFormula(_ operators: String, _ operands: String) -> LabelValues {
        if formula.isEmpty {
            if operands == CalculatorNamespace.zero {
                return (operandValue: CalculatorNamespace.empty,
                        operatorValue: CalculatorNamespace.empty)
            } else {
                formula += "\(operands)"
                return (operandValue: operands,
                        operatorValue: CalculatorNamespace.empty)
            }
        }
        formula += "\(operators)\(operands)"
        return (operandValue: operands, operatorValue: operators)
    }
    
    mutating func addOperandsLabel(_ currentOperands: String, _ inputOperands: String) -> String {
        let numberOperands = isCalculate ? CalculatorNamespace.zero : currentOperands
        isCalculate = false
        
        if numberOperands
            .replacingOccurrences(of: CalculatorNamespace.negative, with: CalculatorNamespace.empty)
            .count >= 12 {
            return numberOperands
        }
        
        if numberOperands.contains(CalculatorNamespace.dot) &&
            inputOperands == CalculatorNamespace.dot {
            return numberOperands
        }

        return numberOperands + inputOperands
    }
    
    func changeSign(_ operands: String) -> String {
        var operands = operands
        guard operands != CalculatorNamespace.zero else { return operands }
        
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
