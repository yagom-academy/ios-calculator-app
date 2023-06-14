//
//  Formula.swift
//  Calculator
//
//  Created by Jusbug, Yetti on 2023/06/02.
//

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    mutating func result() -> Double {
        guard var result: Double = operands.dequeue() else { return 0 }
        
        while operators.isEmpty == false {
            let lhs = result
            guard let rhs: Double = operands.dequeue(),
                  let `operator`: Operator = operators.dequeue() else { return 0 }
            
            result = `operator`.calculate(lhs: lhs, rhs: rhs)
        }
        
        return result
    }
}
