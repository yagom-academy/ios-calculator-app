//
//  FormulaErrors.swift
//  Calculator
//
//  Created by karen on 2023/06/13.
//

import Foundation

enum FormulaErrors: LocalizedError {
    case divisionByZero

    var errorDescription: String? {
        switch self {
        case .divisionByZero:
            return "0으로 나눌 수 없습니다."
        }
    }
}
