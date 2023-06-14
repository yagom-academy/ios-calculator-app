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
        let operands = numberOperands + inputOperands
        isCalculate = false
        
        if operands.filter({ String($0) == CalculatorNamespace.comma }).count == 4 ||
            numberOperands.count >= 13 {
            return numberOperands
        }
        
        if numberOperands.contains(CalculatorNamespace.dot) &&
            inputOperands == CalculatorNamespace.dot {
            return numberOperands
        }

        return operands
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
