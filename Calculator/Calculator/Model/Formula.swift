//
//  Formula.swift
//  Calculator
//
//  Created by Hamo on 2022/09/26.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    init(operands: CalculatorItemQueue<Double>, operators: CalculatorItemQueue<Operator>) {
        self.operands = operands
        self.operators = operators
    }
    
    mutating func result() throws -> Double? {
        guard let rhs = operands.dequeue() else {
            return nil
        }
        
        guard let lhs = operands.dequeue() else {
            return nil
        }
        
        guard let arithmeticOperator = operators.dequeue() else {
            return nil
        }
        
        let result = try arithmeticOperator.calculate(lhs: lhs, rhs: rhs)
        return result
    }
}
