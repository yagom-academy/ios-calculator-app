//
//  Formula.swift
//  Calculator
//
//  Created by H on 2/14/24.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    var operators: CalculatorItemQueue<String> = CalculatorItemQueue<String>()
    
    mutating func result() throws -> Double {
        var formulaResult: Double? = nil
        
        while let operand = operands.pop() {
            if let result = formulaResult {
                let operatorCharacter = operators.pop()
                
                switch operatorCharacter {
                case "+":
                    formulaResult = Operator.add.calculate(lhs: result, rhs: operand)
                case "-":
                    formulaResult = Operator.substract.calculate(lhs: result, rhs: operand)
                case "%":
                    if operand == 0 {
                        throw CalculatorError.divideByZero
                    }
                    
                    formulaResult = Operator.divide.calculate(lhs: result, rhs: operand)
                case "*":
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
