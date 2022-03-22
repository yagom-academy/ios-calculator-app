//
//  QueueError.swift
//  Calculator
//
//  Created by 조민호 on 2022/03/18.
//

import Foundation

enum QueueError: Error {
    case notFoundElement
}

extension QueueError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFoundElement:
            return "현재 큐가 비어있어 dequeue가 불가능합니다."
        }
    }
}
