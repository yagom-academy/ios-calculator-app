//
//  OperationManager.swift
//  Calculator
//
//  Created by Erick on 2023/06/11.
//

import Foundation

struct OperationManager {
    private var formula: String = CalculatorNamespace.Empty
    private var isCalculate: Bool = false
    
    mutating func calculateFormula() -> String {
        var parsedFormula = ExpressionParser.parse(from: formula)
        let result = OperandFormatter.formatStringOperand(String(parsedFormula.result()))
        isCalculate = true
        clearFormula()
        
        return result
    }
    
    @discardableResult
    mutating func addFormula(_ operatror: String, _ operands: String) -> (String, String) {
        let `operator` = operatror
        let operands = OperandFormatter.formatStringOperand(operands)
        
        if formula.isEmpty && operands != CalculatorNamespace.Zero  {
            formula += "\(operands)"
            return (CalculatorNamespace.Empty, operands)
        } else if operands != CalculatorNamespace.Zero {
            formula += "\(`operator`)\(operands)"
            return (`operator`, operands)
        }
        
        if `operator` == String(Operator.divide.rawValue) && operands == CalculatorNamespace.Zero {
            formula += "\(`operator`)\(operands) "
        }
        
        return (CalculatorNamespace.Empty, CalculatorNamespace.Empty)
    }
    
    mutating func addOperandsLabel(_ currentOperands: String, _ inputOperands: String) -> String {
        let numberOperands = isCalculate ? CalculatorNamespace.Zero : currentOperands
        let operands = OperandFormatter.formatStringOperand(numberOperands + inputOperands)
        
        if operands.filter({ $0 == "," }).count == 4 || numberOperands.count >= 13 {
            return currentOperands
        }
        
        if numberOperands.contains(CalculatorNamespace.Dot) && (inputOperands == CalculatorNamespace.Zero || inputOperands == CalculatorNamespace.DoubleZero) {
            let result = numberOperands + inputOperands
            return result
        } else if !numberOperands.contains(CalculatorNamespace.Dot) && inputOperands == CalculatorNamespace.Dot {
            let result = operands + inputOperands
            return result
        }
        
        isCalculate = false
        return operands
    }
    
    func changeSign(_ operands: String) -> String {
        var operands = operands
        guard operands != CalculatorNamespace.Zero else { return CalculatorNamespace.Zero }
        
        if operands.contains(CalculatorNamespace.Negative) {
            operands.removeFirst()
        } else {
            operands.insert(Character(CalculatorNamespace.Negative), at: operands.startIndex)
        }
        
        return operands
    }
    
    mutating func clearFormula() {
        formula = CalculatorNamespace.Empty
    }
}
