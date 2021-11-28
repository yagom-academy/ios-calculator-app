//
//  CalculatorError.swift
//  Calculator
//
//  Created by 박우연 on 2021/11/22.
//

import Foundation

enum CalculatorQueueError: Error {
    case emptyQueue
}

extension CalculatorQueueError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .emptyQueue:
            return "Queue is Empty"
        }
    }
}
