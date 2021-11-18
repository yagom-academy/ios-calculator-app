//
//  CalculatorError.swift
//  Calculator
//
//  Created by 박우연 on 2021/11/10.
//

import Foundation

enum CalculatorQueueError: Error, CustomStringConvertible {
    case emptyQueue
    
    var description: String {
        switch self {
        case .emptyQueue:
            return "Queue is Empty"
        }
    }
}

enum CalculateError: Error, CustomStringConvertible {
    case divideByZero
    
    var description: String {
        switch self {
        case .divideByZero:
            return "Cannot divide by zero"
        }
    }
}
