//
//  Formula.swift
//  Calculator
//
//  Created by Gordon Choi on 2022/05/19.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        guard let lhs = operands.dequeue(),
              let rhs = operands.dequeue(),
              let operation = operators.dequeue() else {
            // TODO: 적절한 에러 핸들링
            return 0
        }
        
        return operation.calculate(lhs: lhs, rhs: rhs)
    }
}
