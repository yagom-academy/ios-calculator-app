//
//  Formula.swift
//  Calculator
//
//  Created by Hisop on 2023/10/11.
//

struct Formula {
    var operands: CalculateItemQueue<Double>
    var operators: CalculateItemQueue<Operator>
    
    mutating func result() -> Double {
        guard var result = operands.dequeue() else {
            return .nan
        }
        
        while let operand = operands.dequeue() {
            guard let `operator` = operators.dequeue() else {
                break
            }
            
            result = `operator`.calculate(lhs: result, rhs: operand)
        }
        
        return result
    }
}
