//
//  Formula.swift
//  Calculator
//
//  Created by SeoDongyeon on 2022/03/17.
//

import Foundation

struct Formula {
    let operands: CalculatorItemQueue<Double>
    let operators: CalculatorItemQueue<Operator>
    
    func result() throws -> Double {
        guard var result = operands.dequeue() else { return 0 }
        
        while !operands.isEmpty {
            guard let operand = operands.dequeue(),
                  let `operator` = operators.dequeue() else { return 0 }
            result = try `operator`.calculate(lhs: result, rhs: operand)
        }
        return result
    }
}
