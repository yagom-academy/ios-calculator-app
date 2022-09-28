//
//  Formula.swift
//  Calculator
//
//  Created by leewonseok on 2022/09/20.
//

import Foundation

struct Formula {
    var operands = CalculatorItemQueue()
    var operators = CalculatorItemQueue()
    
    public mutating func result() throws -> Double {
        guard var result = operands.dequeue() as? Double else { throw CalculatorError.emptyError }

        for _ in 1...operands.count {
            guard let number = self.operands.dequeue() as? Double,
                  let `operator` = self.operators.dequeue() as? Operator else { throw CalculatorError.emptyError }
            
            if `operator` == Operator.divide && number == .zero { throw CalculatorError.divideError }
            
            result = `operator`.calculate(lhs: result, rhs: number)
        }
        return result
    }
}
