//
//  Formula.swift
//  Calculator
//
//  Created by Rowan on 2023/01/27.
//

struct Formula {
    var operands = CalculatorItemQueue<Double>(list: LinkedList())
    var `operators` = CalculatorItemQueue<Operator>(list: LinkedList())
    
    @discardableResult
    mutating func result() -> Double {
        var result: Double = 0
        let minCountForCalculate = 1
        
        if operands.itemCount > minCountForCalculate,
            let firstOperand = operands.dequeue() {
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
