//
//  Formula.swift
//  Calculator
//
//  Created by leewonseok on 2022/09/20.
//

import Foundation

struct Formula {
    var operands = CalculatorItemQueue()
    var operators = CalculatorItemQueue()
    
    public mutating func result() throws -> Double {
        // 여기서 숫자를 하나 빼고 시작하면 operands와 operators 의 길이가 같아짐
        guard var totalNumber = operands.dequeue() as? Double else { return 0.0 }

        for _ in 1...operands.count {
            // 내부에서 구현해야할 것
            // 0으로 시도하는 경우 ? number 가 0 이면 에러를 표출하여야한다?
            // 각종 예외사항과 오류사항에 대해 대처하면 더 좋다
            // 1. 나누기일 경우, number 값에 0 이 있으면 에러
            
            // 연산값
            guard let number = self.operands.dequeue() as? Double else { return 0.0 }
            // 연산자
            guard let operatorSymbol = self.operators.dequeue() as? Operator else { return 0.0 }
            
            if operatorSymbol == Operator.divide && number == 0.0 { throw CalculatorError.divideError }
            
            totalNumber = operatorSymbol.calculate(lhs: totalNumber, rhs: number)
        }
        return totalNumber
    }
}
