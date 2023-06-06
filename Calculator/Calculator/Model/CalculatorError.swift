//
//  CalculatorError.swift
//  Calculator
//
//  Created by Dasan on 2023/06/05.
//

import Foundation

enum CalculatorError: LocalizedError {
    case NotANumber
    case FailedOperation
    
    var errorDescription: String? {
        switch self {
        case .NotANumber:
            return "NaN"
        case .FailedOperation:
            return "Failed Operation"
        }
    }
}
