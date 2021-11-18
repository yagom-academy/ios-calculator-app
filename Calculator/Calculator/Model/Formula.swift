//
//  Formula.swift
//  Calculator
//
//  Created by 예거 on 2021/11/15.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    func result() -> Double {
        let operatorsCount = operators.queue.count
        
        switch operatorsCount {
        case 1:
            return operators.queue[0].calculate(operands.queue[0], operands.queue[1])
        case 2...:
            var partialResult: Double = operators.queue[0].calculate(operands.queue[0], operands.queue[1])
            for i in 1...(operatorsCount - 1) {
                partialResult = operators.queue[i].calculate(partialResult, operands.queue[i+1])
            }
            return partialResult
        default:
            return Double.nan // 계산기에 찍힌 숫자 그대로 재출력 (ex. 숫자는 입력하고, 연산자 안 누르고 = 누른 경우엔 그 숫자를 그대로 보여줌)
        }
    }
}
