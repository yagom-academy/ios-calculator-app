//
//  Formula.swift
//  Calculator
//
//  Created by redmango1446 on 2023/06/06.
//

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
    var operatos: CalculatorItemQueue<Operator> = CalculatorItemQueue()
    
    mutating func result() throws -> Double {
        var result: Double = 0
        
        guard !operatos.isEmpty else {
            return operands.dequeue() ?? 0
        }
        
        guard var lhs = operands.dequeue() else {
            return 0
        }
        
        while let currentOperator = operatos.dequeue() {
            
            guard let rhs = operands.dequeue() else {
                throw CalculatorError.incompleteFormula
            }
            
            result = try currentOperator.calculate(lhs: lhs, rhs: rhs)
            lhs = result
        }
        
        return result
    }
}
