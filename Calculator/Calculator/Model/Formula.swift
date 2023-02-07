//
//  Formula.swift
//  Calculator
//
//  Created by Christy Lee on 2023/01/30.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        var result: Double = 0
        guard let lhs = operands.dequeue() else { return .zero }
        result = lhs
        
        while !operands.isEmpty {
            guard let operatorSymbol = operators.dequeue(), let rhs = operands.dequeue() else { break }
            result = operatorSymbol.calculate(lhs: result, rhs: rhs)
        }
        return result
    }
}
