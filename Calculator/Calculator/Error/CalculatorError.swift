//
//  CalculatorError.swift
//  Calculator
//
//  Created by 임지연 on 2022/10/06.
//

enum CalculatorError: Error, CustomStringConvertible {
    case queueIsEmpty
    case divisionByZero
    case unknown
    var description: String {
        switch self {
        case .queueIsEmpty:
            return "큐가 비어있습니다."
        case .divisionByZero:
            return "NaN"
        case .unknown:
            return "알 수 없는 에러입니다."
        }
    }
}
