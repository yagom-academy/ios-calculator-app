//
//  ListError.swift
//  Calculator
//
//  Created by 이승재 on 2021/11/10.
//

import Foundation

enum QueueError: Error {
    case emptyItem
    case emptyOperandItem
    case emptyOperatorItem
}

extension QueueError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .emptyOperandItem:
            return "피연산자 큐가 비어있습니다."
        case .emptyOperatorItem:
            return "연산자 큐가 비어있습니다."
        case .emptyItem:
            return "큐가 비어있습니다."
        }
    }
}
