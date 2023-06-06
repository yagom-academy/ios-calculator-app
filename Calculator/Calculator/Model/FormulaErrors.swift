//
//  FormulaErrors.swift
//  Calculator
//
//  Created by MARY on 2023/06/05.
//

import Foundation

enum FormulaErrors {
    case invalidFormula
    case noValueInQueue
    case notDivisibleByZero
}

extension FormulaErrors: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidFormula:
            return "유효하지 않은 수식입니다."
        case .noValueInQueue:
            return "큐에 값이 없습니다."
        case .notDivisibleByZero:
            return "0으로 나눌 수 없습니다."
        }
    }
}
