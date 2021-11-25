//
//  CalculateError.swift
//  Calculator
//
//  Created by 고은 on 2021/11/22.
//

import Foundation

enum CalculateError: Error {
    case divideByZero
}

extension CalculateError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .divideByZero:
            return "Cannot divide by zero"
        }
    }
}
