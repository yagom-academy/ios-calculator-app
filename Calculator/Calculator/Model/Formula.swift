//
//  Formula.swift
//  Calculator
//
//  Created by Jiyoung Lee on 2022/09/24.
//

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
    
    mutating func result() throws -> Double {
        guard var result = operands.dequeue() else { return 0 }
        
        while !operands.isEmpty && !operators.isEmpty {
            guard let operatorSign = operators.dequeue() else { return 0 }
            guard let rhs = operands.dequeue() else { return 0 }
            
            if operatorSign == .divide, rhs == 0 {
                throw FormulaError.divisorIsZero
            }
            
            result = operatorSign.calculate(lhs: result, rhs: rhs)
        }
        
        return result
    }
}
