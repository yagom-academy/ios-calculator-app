//
//  Formula.swift
//  Calculator
//
//  Created by Rowan on 2023/01/27.
//

struct Formula {
    var operands = CalculatorItemQueue<Double>(queueList: LinkedList())
    var `operators` = CalculatorItemQueue<Operator>(queueList: LinkedList())
    
    mutating func result() -> Double {
        var result: Double = 0
        
        if let firstOperand = operands.dequeue() {
            result = firstOperand
        }
        
        while operands.isEmpty() == false {
            guard let rhs = operands.dequeue() else { break }
            guard let `operator` = self.operators.dequeue() else { break }
            let lhs = result
            let operatedResult = `operator`.calculate(lhs: lhs, rhs: rhs)
            
            result = operatedResult
        }
        
        return result
    }
}
