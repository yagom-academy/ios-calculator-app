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
        var result: Double = 0
        
        // 얘는 타입이 Operator
        guard let lhs = operands.dequeue() else { return 0 }
        guard let operatorSign = operators.dequeue() else { return 0 }
        guard let rhs = operands.dequeue() else { return 0 }
        
        
        result = operatorSign.calculate(lhs: lhs, rhs: rhs)
        
        return result
    }
}
