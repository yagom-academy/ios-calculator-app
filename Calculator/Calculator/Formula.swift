//
//  Formula.swift
//  Calculator
//
//  Created by redmango1446 on 2023/06/06.
//

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
    var operatos: CalculatorItemQueue<Operator> = CalculatorItemQueue()
    
    mutating func result() -> Double {
        var result: Double = 0
        
        guard !operatos.isEmpty else {
            return 0.1 // 추후 에러처리
        }
        
        guard var lhs = operands.dequeue() else {
            return 0.2 // 추후 에러처리
        }
        
        while !operatos.isEmpty {
            
            guard let rhs = operands.dequeue(), let currentOperator = operatos.dequeue() else {
                return 0.3 // 추후 에러처리
            }
            
            result = currentOperator.calculate(lhs: lhs, rhs: rhs)
            lhs = result
        }
        
        return result
    }
}
