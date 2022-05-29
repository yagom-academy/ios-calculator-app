//
//  Error.swift
//  Calculator
//
//  Created by Minseong Kang on 2022/05/28.
//

enum CalculatorError: Error {
    case dividedByZero
    
    var description: String {
        switch self {
        case .dividedByZero:
            return "NaN"
        }
    }
}
