//
//  Formula.swift
//  Calculator
//
//  Created by 조민호 on 2022/03/18.
//

import Foundation

struct Formula {
    private var operands: CalculatorItemQueue<Double>
    private var operators: CalculatorItemQueue<Operator>

    init(operands: CalculatorItemQueue<Double>,
         operators: CalculatorItemQueue<Operator>) {
        self.operands = operands
        self.operators = operators
    }
    
    mutating func result() throws -> Double {
        var result: Double = 0.0

        while operands.isEmpty == false {
            guard let operand = try operands.dequeue() else {
                
                throw QueueError.notFoundElement
            }
            
            guard let `operator` = try operators.dequeue() else {
                
                throw QueueError.notFoundElement
            }
            
            result = try `operator`.calculate(lhs: result, rhs: operand)
        }
        
        return result
    }
}
