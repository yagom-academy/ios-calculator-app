//
//  Formula.swift
//  Calculator
//
//  Created by 김태현 on 2022/03/18.
//

struct Formula {
    var operands: CalculatorItemQueue
    var operators: CalculatorItemQueue
    
    func result() throws -> Double {
        var result = operands.dequeue() as? Double ?? 0.0
        
        try operators
            .forEach {
                guard let `operator` = $0.data as? Operator,
                let rhs = operands.dequeue() as? Double else {
                    return
                }
                result = try `operator`.calculate(lhs: result, rhs: rhs)
            }
        
        return result
    }
}
