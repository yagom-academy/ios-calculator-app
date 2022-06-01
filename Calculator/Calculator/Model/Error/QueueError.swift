//
//  QueueError.swift
//  Calculator
//
//  Created by bard,hugh on 2022/05/30.
//

import Foundation

enum QueueError: LocalizedError {
    case unknown
    case wrongOperators
    case wrongOperands
}

extension QueueError {
    var errorDescription: String {
        switch self {
        case .unknown:
            return NSLocalizedString("0",
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
