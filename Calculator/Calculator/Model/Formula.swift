//
//  Formula.swift
//  Calculator
//
//  Created by Eunsoo KIM on 2021/11/12.
//

import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    
    func result() -> Double {
        
        var result: Double = 0.0
        
        guard let initialValue = operands.dequeue() else {
            return 0.0
        }
        
        result = result + initialValue
        
        while operands.queue.first != nil {
            result = operators.dequeue()?.calculate(lhs: result,
                                                     rhs: operands.dequeue() ?? 0.0) ?? 0.0
        }
        
        return result
        
    }
    
}
