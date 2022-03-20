//
//  Formula.swift
//  Calculator
//
//  Created by 김태현 on 2022/03/18.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    func result() throws -> Double {
        var result = try operands.dequeue()
        
        try operators
            .forEach {
                let `operator` = $0.data
                let rhs = try operands.dequeue()
                result = try `operator`.calculate(lhs: result, rhs: rhs)
            }
        return result
    }
}
