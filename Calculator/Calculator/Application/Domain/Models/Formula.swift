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
        guard var result = operands.dequeue() else {
            // TODO: 값이 없을 때 적절한 에러 핸들링
            print("주어진 값이 없습니다.")
            return 0
        }
        
        while !operators.isEmpty && !operands.isEmpty {
            let nextOperator = operators.dequeue()
            let nextOperand = operands.dequeue()
            result = nextOperator?.calculate(lhs: result, rhs: nextOperand ?? 0) ?? result
        }
        
        return result
    }
}
