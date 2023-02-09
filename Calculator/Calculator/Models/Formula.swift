//
//  Formula.swift
//  Calculator
//
//  Created by Seoyeon Hong on 2023/01/31.
//

struct Formula {
    var operands: CalculatorItemQueue<Double> = .init()
    var operators: CalculatorItemQueue<Operator> = .init()
    
    @discardableResult
    mutating func result() -> Double {
        var result: Double = 0
        let minCountForCalculate = 1
        
        if operands.itemCount > minCountForCalculate,
           operands.itemCount != operators.itemCount,
            let firstOperand = operands.dequeue() {
            result = firstOperand
        }
        
        while let rhs = operands.dequeue(),
              let `operator` = self.operators.dequeue() {
            let operatedResult = `operator`.calculate(lhs: result, rhs: rhs)
            result = operatedResult
        }
        
        return result
    }
}
