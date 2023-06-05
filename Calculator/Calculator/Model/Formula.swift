//
//  Formula.swift
//  Calculator
//
//  Created by Min Hyun on 2023/05/31.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        var result = try operands.dequeue()
        
        while operands.count > 0 {
            let operatorItem = try operators.dequeue()
            let rhs = try operands.dequeue()
            result = try operatorItem.calculate(lhs: result, rhs: rhs)
        }
        
        return result
    }
}
