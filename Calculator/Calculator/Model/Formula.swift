//
//  Formula.swift
//  Calculator
//
//  Created by H on 2/14/24.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
    
    mutating func result() throws -> Double {
        var formulaResult: Double? = nil
        
        while let operand = operands.pop() {
            if let result = formulaResult {
                let operatorCharacter = operators.pop()
                
                switch operatorCharacter {
                case .add:
                    formulaResult = Operator.add.calculate(lhs: result, rhs: operand)
                case .substract:
                    formulaResult = Operator.substract.calculate(lhs: result, rhs: operand)
                case .divide:
                    if operand == 0 {
                        throw CalculatorError.divideByZero
                    }
                    
                    formulaResult = Operator.divide.calculate(lhs: result, rhs: operand)
                case .multiply:
                    formulaResult = Operator.multiply.calculate(lhs: result, rhs: operand)
                default:
                    break
                }
            } else {
                formulaResult = operand
            }
        }
        
        return formulaResult ?? 0.0
    }
}
