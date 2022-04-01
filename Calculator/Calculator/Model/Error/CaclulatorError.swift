//
//  CaclulatorError.swift
//  Calculator
//
//  Created by 김태훈 on 2022/03/29.
//

import Foundation

enum CalculatorError {
    case divisionByZero
    case nonOperand
    case nonOperator
}

extension CalculatorError: Error {
    var errorDescription: String {
        switch self {
        case .divisionByZero:
            return "NaN"
        case .nonOperand:
            return "nonOperandError"
        case .nonOperator:
            return "nonOperatorError"
        }
    }
}
