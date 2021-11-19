//
//  QueueError.swift
//  Calculator
//
//  Created by Ari on 2021/11/10.
//

import Foundation

enum CalculatorError: Error, LocalizedError {
    case queueNotFound
    case wrongOperator
    case wrongOperand
    case isNaN
    
    var errorDescription: String? {
        switch self {
        case .queueNotFound:
            return "큐가 비어있습니다. 계산식을 추가해주세요."
        case .wrongOperator:
            return "잘못된 연산자입니다."
        case .wrongOperand:
            return "잘못된 숫자입니다."
        default:
            return "알 수 없는 에러가 발생했습니다."
        }
    }
    var failureReason: String? {
        switch self {
        case .isNaN:
            return "NaN"
        default:
            return nil
        }
    }
}
