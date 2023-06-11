//
//  CalculatorError.swift
//  Calculator
//
//  Created by Min Hyun on 2023/05/29.
//

enum CalculatorError: Error {
    case indexOutOfRange
    case divideByZero
    case unknown
    
    var message: String {
        switch self {
        case .indexOutOfRange:
            return "범위를 벗어난 접근입니다."
        case .divideByZero:
            return "0으로 나눌 수 없습니다."
        case .unknown:
            return "알 수 없는 오류입니다."
        }
    }
}

