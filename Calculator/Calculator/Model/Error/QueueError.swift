//
//  QueueError.swift
//  Calculator
//
//  Created by 김동용 on 2022/05/17.
//

import Foundation

enum QueueError: LocalizedError {
    case empty
    case unknownError
}

extension QueueError {
    public var errorDescription: String? {
        switch self {
        case .empty:
            return NSLocalizedString("empty", comment: "deQueue stack is empty")
        case .unknownError:
            return NSLocalizedString("unknown error", comment: "unknown error")
        }
    }
}
