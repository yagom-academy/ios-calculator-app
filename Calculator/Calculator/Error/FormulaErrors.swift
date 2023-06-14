//
//  FormulaErrors.swift
//  Calculator
//
//  Created by karen, Mary.
//

import Foundation

enum FormulaErrors {
    case notDivisibleByZero
}

extension FormulaErrors: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notDivisibleByZero:
            return "0으로 나눌 수 없습니다."
        }
    }
}
