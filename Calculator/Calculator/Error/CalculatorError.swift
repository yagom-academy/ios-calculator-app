//
//  CalculatorError.swift
//  Calculator
//
//  Created by 박우연 on 2021/11/10.
//

import Foundation

enum CalculatorError: Error, CustomStringConvertible {
    case emptyQueue
    case divideByZero
    
    var description: String {
        switch self {
        case .emptyQueue:
            return "Queue is Empty"
        case .divideByZero:
            return "Cannot divide by zero"
        }
    }
}
