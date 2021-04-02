//
//  Error.swift
//  Calculator
//
//  Created by Ryan-Son on 2021/04/01.
//

import Foundation

enum DecimalCalculatorError: Error, CustomStringConvertible {
    case divisionByZero
    case notAvailableOperator
    case notNumber
    case nilInputFoundWhileConvertingTypeOfOperator
    case cannotCalculate
    
    var description: String {
        switch self {
        case .divisionByZero:
            return "0으로 나눌 수 없습니다."
        case .notAvailableOperator:
            return "사용할 수 없는 연산자입니다."
        case .notNumber:
            return "숫자가 아닙니다."
        case .nilInputFoundWhileConvertingTypeOfOperator:
            return "연산자가 nil 값입니다."
        case .cannotCalculate:
            return "계산을 할 수 없습니다."
        default:
            return "알 수 없는 에러입니다."
        }
    }
}

enum BinaryCalculatorError: Error, CustomStringConvertible {
    case divisionByZero
    case notAvailableOperator
    case notNumber
    case nilInputFoundWhileConvertingTypeOfNumber
    case nilInputFoundWhileConvertingTypeOfOperator
    case cannotCalculate
    
    var description: String {
        switch self {
        case .divisionByZero:
            return "0으로 나눌 수 없습니다."
        case .notAvailableOperator:
            return "사용할 수 없는 연산자입니다."
        case .notNumber:
            return "숫자가 아닙니다."
        case .nilInputFoundWhileConvertingTypeOfOperator:
            return "연산자가 nil 값입니다."
        case .cannotCalculate:
            return "계산을 할 수 없습니다."
        default:
            return "알 수 없는 에러입니다."
        }
    }
}
