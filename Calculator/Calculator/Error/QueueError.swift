//
//  ListError.swift
//  Calculator
//
//  Created by 이승재 on 2021/11/10.
//

import Foundation

enum QueueError: Error {
    case operandQueueIsEmpty
    case operatorQueueIsEmpty
}

extension QueueError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .operandQueueIsEmpty:
            return "피연산자 큐가 비어있습니다."
        case .operatorQueueIsEmpty:
            return "연산자 큐가 비어있습니다."
        }
    }
}
