//
//  CalculatorError.swift
//  Calculator
//
//  Created by Dasan on 2023/06/05.
//

import Foundation

enum CalculatorError: LocalizedError {
    case notANumber
    case invalidOperation
    
    var errorDescription: String? {
        switch self {
        case .notANumber:
            return "NaN"
        case .invalidOperation:
            return "invalid Operation"
        }
    }
}
