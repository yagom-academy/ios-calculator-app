//
//  FormulaErrors.swift
//  Calculator
//
//  Created by MARY on 2023/06/05.
//

import Foundation

enum FormulaErrors {
    case invalidFormula
    case invalidOperators
    case invalidOperands
}

extension FormulaErrors: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidFormula:
            return "유효하지 않은 수식입니다."
        case .invalidOperators:
            return "유효하지 않은 연산자입니다."
        case .invalidOperands:
            return "유효하지 않은 숫자입니다."
        }
    }
}
