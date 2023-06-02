//
//  Formula.swift
//  Calculator
//
//  Created by Erick on 2023/06/01.
//

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        guard var result: Double = operands.dequeue() else { return Double(0) }
        
        while !operators.isEmpty {
            let lhs = result
            guard let rhs: Double = operands.dequeue(),
                  let oper: Operator = operators.dequeue() else { return result }
            
            result = oper.calculate(lhs: lhs, rhs: rhs)
        }
        
        return result
    }
}
