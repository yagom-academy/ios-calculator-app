//
//  Formula.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/09.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        var result = try operands.deQueue()
        
        while operators.isEmpty == false {
            let operatorOfDeQueue = try operators.deQueue()
            
            result = try operatorOfDeQueue.calculate(lhs: result, rhs: try operands.deQueue())
        }
        
        return result
    }
}
