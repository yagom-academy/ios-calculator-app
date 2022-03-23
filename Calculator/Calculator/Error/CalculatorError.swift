//
//  CalculatorError.swift
//  Calculator
//
//  Created by 조민호 on 2022/03/18.
//

import Foundation

enum CalculatorError: Error {
    case dividedByZero
}

extension CalculatorError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .dividedByZero:
            return "NaN"
        }
    }
}
