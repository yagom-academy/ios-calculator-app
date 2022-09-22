//
//  CalculatorError.swift
//  Calculator
//
//  Created by 노유빈 on 2022/09/22.
//

enum CalculatorError: Error {
    case queueIsEmpty
    case divisionByZero
}

extension CalculatorError: CustomDebugStringConvertible {
    var debugDescription: String {
        switch self {
        case .queueIsEmpty:
            return "큐가 비어있습니다."
        case .divisionByZero:
            return "0으로 나눌 수 없습니다."
        }
    }
}
