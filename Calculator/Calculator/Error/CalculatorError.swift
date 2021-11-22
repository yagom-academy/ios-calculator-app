//
//  CalculatorError.swift
//  Calculator
//
//  Created by 박우연 on 2021/11/22.
//

import Foundation

enum CalculatorError: Error, CustomStringConvertible {
    case emptyQueue
    
    var description: String {
        switch self {
        case .emptyQueue:
            return "Queue is Empty"
        }
    }
}
