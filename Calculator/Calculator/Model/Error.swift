//
//  Error.swift
//  Calculator
//
//  Created by Minseong Kang on 2022/05/28.
//

import Foundation

enum CalculatorError: Error {
    case divisionByZero
    
    var description: String {
        switch self {
        case .divisionByZero:
            return "NaN"
        }
    }
}
