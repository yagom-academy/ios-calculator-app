//
//  Formula.swift
//  Calculator
//
//  Created by idinaloq on 2023/06/02.
//

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        guard let firstLhs: Double = operands.dequeue() else {
            return 0
        }
        
        var result: Double = firstLhs
        
        while !(operands.isEmpty || operators.isEmpty) {
            var lhs: Double = result
            
            guard let rhs: Double = operands.dequeue(),
                  let operation: Operator = operators.dequeue() else {
                return 0
            }
            
            result = operation.calculate(lhs: lhs, rhs: rhs)
        }
        return result
    }
}
