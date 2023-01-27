//
//  Formula.swift
//  Calculator
//
//  Created by Rowan on 2023/01/27.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var `operator`: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        var result: Double = 0
        
        if let firstOperand = operands.dequeue() {
            result = firstOperand
        }
        
        while operands.isEmpty() == false {
            let lhs = result
            guard let rhs = operands.dequeue() else { break }
            guard let `operator` = self.operator.dequeue() else { break }
            
            let operatedResult = `operator`.calculate(lhs: lhs, rhs: rhs)
            
            result = operatedResult
        }
        
        return result
    }
}
