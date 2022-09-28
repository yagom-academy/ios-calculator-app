//
//  Formula.swift
//  Calculator
//
//  Created by Baem on 2022/09/24.
//

struct Formula {
    var operands: CalculatorItemQueue
    var operators: CalculatorItemQueue
    
    mutating func result() throws -> Double {
        var calculateResult: Double
        guard operators.count == (operands.count - 1) else {
            throw FormulaError.notValidCountQueue
        }
        
        guard let firstOperand = operands.dequeue() else {
            throw FormulaError.hasNotOperandValue
        }
        
        guard let firstOperand = firstOperand as? Double else {
            throw FormulaError.isNotDouble
        }
        calculateResult = firstOperand
        
        while !(operators.count == 0) {
            guard let operators = operators.dequeue() as? Operator else {
                throw FormulaError.hasNotOperatorValue
            }
            
            guard let operand = operands.dequeue() as? Double else {
                throw FormulaError.hasNotOperandValue
            }
            
            calculateResult = try operators.calculates(
                lhs: calculateResult,
                rhs: operand
            )
        }
            
        return calculateResult
    }
}
