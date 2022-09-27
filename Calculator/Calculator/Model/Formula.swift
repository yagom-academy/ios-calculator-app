//
//  Formula.swift
//  Calculator
//
//  Created by jin on 9/21/22.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    func result() throws -> Double {
        
        guard let initialValue = operands.dequeue() else { return 0 }
        var result = initialValue
        
        while !operands.isEmpty() {
            guard let newValue = operands.dequeue() else { return 0 }
            result = try operators.dequeue()?.calculate(lhs: result, rhs: newValue) ?? 0
        }
        
        return result
    }
}
