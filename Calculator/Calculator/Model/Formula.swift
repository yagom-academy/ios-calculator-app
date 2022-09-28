//
//  Formula.swift
//  Calculator

import Foundation

struct Formula {
    var operands: CalculatorItemQueue
    var operators: CalculatorItemQueue
    
    init(operrands: CalculatorItemQueue, operators: CalculatorItemQueue) {
        self.operands = operrands
        self.operators = operators
    }
    
    mutating func result() throws -> Double {
        //UI에서 입력받을 시 처음 값이 양수면 operator 앞에 "+"알아서 추가
        let result = try operands.mergedQueue.reduce(0.0) {
            guard let nowOperator = operators.popFirst() as? Operator else {
                throw CalculateError.invalidOperator
            }
            guard let operands = $1 as? Double else {
                throw CalculateError.invalidOperand
            }
            
            return nowOperator.calculate(lhs: $0, rhs: operands)
        }
        return result
    }
}
