//
//  CalculatorError.swift
//  Calculator
//
//  Created by 이시원 on 2022/03/23.
//

import Foundation

enum CalauletorError: Error {
    case dividedByZero
    case invalidInputValue
    case cannotCalculation
    case operandIsNil
    case operatorIsNil
}

extension CalauletorError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .dividedByZero:
            return "NaN"
        case .invalidInputValue:
            return "잘못된 입력입니다."
        case .cannotCalculation:
            return "잘못된 입력입니다."
        case .operandIsNil:
            return "피연산자 입력이 잘못되었습니다."
        case .operatorIsNil:
            return "연산자 입력이 잘못되었습니다."
        }
    }
}
