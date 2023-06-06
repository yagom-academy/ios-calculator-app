//
//  CalculatorError.swift
//  Calculator
//
//  Created by Yena on 2023/06/05.
//

import Foundation

enum CalculatorError: LocalizedError {
    case NotANumber
    case OperationFailed
    
    var errorDescription: String? {
        switch self {
        case .NotANumber:
            return "NaN"
        case .OperationFailed:
            return "Operation Failed"
        }
    }
}
