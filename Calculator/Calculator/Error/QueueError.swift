//
//  ListError.swift
//  Calculator
//
//  Created by 이승재 on 2021/11/10.
//

import Foundation

enum QueueError: Error {
    case EmptyQueue
    case OperandIsEmpty
    case OperatorIsEmpty
}

extension QueueError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .EmptyQueue:
            return "큐가 비어있습니다."
        case .OperandIsEmpty:
            return "피연산자 큐가 비어있습니다."
        case .OperatorIsEmpty:
            return "연산자 큐가 비어있습니다."
        }
    }
}
