//
//  DevideError.swift
//  Calculator
//
//  Created by 이은찬 on 2022/05/20.
//
import Foundation

enum CalculatorError: Error {
    case dividedByZero
    case emptyQueues
    case notEnoughOperators
    case notEnoughOperands
    case notEnoughOperatorsAndOperands
    case invalidOperator
    case lackOfInput
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
        case .notEnoughOperatorsAndOperands:
            return NSLocalizedString("not enough operators and operands", comment: "Error: The number of Operators must be one less than the number of Operands")
        case .invalidOperator:
            return NSLocalizedString("invalid operator", comment: "Error: Invalid Operator")
        case .lackOfInput:
            return NSLocalizedString("lack of input", comment: "Error: At least one error occured")
        }
    }
}
