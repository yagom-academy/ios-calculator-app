//
//  Formula.swift
//  Calculator
//
//  Created by 유한석 on 2022/05/19.
//
struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        guard var formulaResult = operands.dequeue()?.value else {
            return 0.0
        }
        
        while operators.count > 0, operands.count > 0 {
            guard let `operator` = operators.dequeue()?.value else {
                return formulaResult
            }
            
            guard let operand = operands.dequeue()?.value else {
                return formulaResult
            }
            
            try formulaResult = `operator`.calculate(lhs: formulaResult, rhs: operand)            
        }
        
        return formulaResult
    }
}
