//
//  Calculator - Formula.swift
//  Created by Rhode, Songjun.
//  Copyright © yagom. All rights reserved.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        guard var lhs = operands.dequeue() else { return .zero }
        
        while operators.isEmpty == false {
            guard let operateSymbol = operators.dequeue(),
                  let rhs = operands.dequeue() else { return lhs }
            lhs = operateSymbol.calculate(lhs: lhs, rhs: rhs)
        }
        
        return lhs
    }
}
