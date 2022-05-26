//
//  CalculatorError.swift
//  Calculator
//
//  Created by 전민수 on 2022/05/19.
//
import Foundation

enum CalculatorError: Error {
    case dividedByZero
    case emptyQueues
    case notEnoughOperators
    case notEnoughOperands
    case invalidOperator
}

extension CalculatorError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .dividedByZero:
            return NSLocalizedString("NaN", comment: "Error: Divided By Zero")
        case .emptyQueues:
            return NSLocalizedString("empty queues", comment: "Error: Empty Queues")
        case .notEnoughOperators:
            return NSLocalizedString("not enough operators", comment: "Error: Not Enough Operators")
        case .notEnoughOperands:
            return NSLocalizedString("not enough operands", comment: "Error: Not Enough Operands")
        case .invalidOperator:
            return NSLocalizedString("invalid operator", comment: "Error: Invalid Operator")
        }
    }
}
