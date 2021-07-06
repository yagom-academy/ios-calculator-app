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
    case stackIsEmpty
    case failedToObtainNumber
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .divideByZero:
            return "NaN"
        case .invalidOperator:
            return "존재하지 않는 연산자입니다."
        case .stackIsEmpty:
            return "스택이 비어있습니다."
        case .failedToObtainNumber:
            return "숫자 값을 얻지 못했습니다."
        case .unknown:
            return "알 수 없는 에러가 발생하였습니다."
        }
    }
}
