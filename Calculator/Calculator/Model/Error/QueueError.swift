//
//  QueueError.swift
//  Calculator
//
//  Created by bard,hugh on 2022/05/30.
//

import Foundation

enum QueueError: LocalizedError {
    case unknown
    case empty
}

extension QueueError {
    var errorDescription: String {
        switch self {
        case .unknown:
            return NSLocalizedString("0",
                                     comment: "unknown error")
        case .empty:
            return NSLocalizedString("0",
                                     comment: "Queue is empty")
        }
    }
}
