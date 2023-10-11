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
            return 0
        }
        
        while !operands.isEmpty(), !operators.isEmpty() {
            guard let operatorType = operators.dequeue() else {
                break
            }
            guard let operand = operands.dequeue() else {
                break
            }
            
            result = operatorType.calculate(lhs: result, rhs: operand)
        }
        
        return result
    }
}
