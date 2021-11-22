//
//  CalculateError.swift
//  Calculator
//
//  Created by 고은 on 2021/11/22.
//

import Foundation

enum CalculateError: Error, CustomStringConvertible {
    case divideByZero
    
    var description: String {
        switch self {
        case .divideByZero:
                    return "Cannot divide by zero"
        }
    }
}
