//
//  CalculatorError.swift
//  Calculator
//
//  Created by 노유빈 on 2022/09/22.
//

enum CalculatorError: Error {
    case queueIsEmpty
    case divisionByZero
    case unknownError
}

extension CalculatorError: CustomStringConvertible {
    var description: String {
        switch self {
        case .queueIsEmpty:
            return "큐가 비어있습니다."
        case .divisionByZero:
            return "0으로 나눌 수 없습니다."
        case .unknownError:
            return "예상치 못한 에러입니다."
        }
    }
}
