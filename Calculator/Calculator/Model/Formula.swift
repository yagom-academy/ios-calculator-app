//
//  Formula.swift
//  Calculator
//
//  Created by Jiyoung Lee on 2022/09/24.
//

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
    
    mutating func result() -> Double {
        guard var lhs = operands.dequeue() else { return 0 }
        
        while !operands.isEmpty && !operators.isEmpty {
            guard let operatorSign = operators.dequeue() else { return 0 }
            guard let rhs = operands.dequeue() else { return 0 }
            
            lhs = operatorSign.calculate(lhs: lhs, rhs: rhs)
        }
        
        
        return lhs
    }
}
