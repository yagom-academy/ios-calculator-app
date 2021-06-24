//
//  CalculatorError.swift
//  Calculator
//
//  Created by JINHONG AN on 2021/06/23.
//

import Foundation

enum CalculatorError: Error, LocalizedError {
    case divideByZero
    case invalidOperator
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .divideByZero:
            return "0으로 나눌 수 없습니다."
        case .invalidOperator:
            return "존재하지 않는 연산자입니다."
        case .unknown:
            return "알 수 없는 에러가 발생하였습니다."
        }
    }
}
