//
//  Formula.swift
//  Calculator
//
//  Created by JeongTaek Han on 2021/11/14.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    func result() throws -> Double {
        guard var result = operands.dequeue() else { return 0.0 }
        
        while let number = operands.dequeue(), let operatorInstance = operators.dequeue() {
            result = try operatorInstance.calculate(lhs: result, rhs: number)
        }
        
        return result
    }
}
