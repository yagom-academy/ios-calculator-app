//
//  Formula.swift
//  Calculator
//
//  Created by 이시원 on 2022/03/18.
//

import Foundation

struct Formula {
    let operands: CalculatorItemQueue<LinkdeList<Double>>
    let operators: CalculatorItemQueue<LinkdeList<Operator>>
    
    func result() throws -> Double {
        guard var value: Double = operands.dequeue() else { return 0 }
        
        while !operands.isEmpty {
            if value.isNaN { return value }
            
            guard let operand = operands.dequeue() else { return value }
            guard let calculatedValue = try operators.dequeue()?.calculate(lhs: value, rhs: operand) else { return value }
            
            value = calculatedValue
        }
        
        return value
    }
}
