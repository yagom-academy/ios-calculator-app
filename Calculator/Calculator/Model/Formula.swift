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
        
        while operands.isEmpty() {
            guard let lhs = operands.dequeue() else { break }
            guard let rhs = operands.dequeue() else { break }
            let `operator` = self.operator.dequeue()
            
            guard let operatedResult = `operator`?.calculate(lhs: lhs, rhs: rhs) else { break }
            
            result = operatedResult
        }
        
        return result
    }
}
