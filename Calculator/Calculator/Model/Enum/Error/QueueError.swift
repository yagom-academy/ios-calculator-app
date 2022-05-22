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
    case wrongOperators
    case wrongOperands
}

extension QueueError {
    var errorDescription: String {
        switch self {
        case .empty:
            return NSLocalizedString("empty",
                                     comment: "deQueue stack is empty")
        case .unknown:
            return NSLocalizedString("unknown error",
                                     comment: "unknown error")
        case .wrongOperators:
            return NSLocalizedString("operators error",
                                     comment: "operators got error")
        case .wrongOperands:
            return NSLocalizedString("operands error",
                                     comment: "operands got error")
        }
    }
}
