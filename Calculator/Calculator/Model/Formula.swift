//
//  Formula.swift
//  Calculator
//
//  Created by 김태현 on 2022/03/18.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    func result() -> Double {
        var result = operands.dequeue() ?? 0
        
        operators.forEach {
            result = $0.data.calculate(lhs: result, rhs: operands.dequeue() ?? 0)
        }
        
        return result
    }
}
