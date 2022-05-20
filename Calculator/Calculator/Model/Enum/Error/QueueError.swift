//
//  QueueError.swift
//  Calculator
//
//  Created by 김동용 on 2022/05/17.
//

import Foundation

enum QueueError: LocalizedError {
    case empty
    case unknown
    case operators
    case operands
}

extension QueueError {
    public var errorDescription: String? {
        switch self {
        case .empty:
            return NSLocalizedString("empty",
                                     comment: "deQueue stack is empty")
        case .unknown:
            return NSLocalizedString("unknown error",
                                     comment: "unknown error")
        case .operators:
            return NSLocalizedString("operators error",
                                     comment: "operators got error")
        case .operands:
            return NSLocalizedString("operands error",
                                     comment: "operands got error")
        }
    }
}
