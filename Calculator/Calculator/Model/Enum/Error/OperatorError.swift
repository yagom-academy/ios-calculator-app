//
//  OperatorError.swift
//  Calculator
//
//  Created by 김동용 on 2022/05/21.
//

import Foundation

enum OperatorError: LocalizedError {
    case devide
    case unknown
}

extension OperatorError {
    public var errorDescription: String? {
        switch self {
        case .devide:
            return NSLocalizedString("devide error",
                                     comment: "devide error")
        case .unknown:
            return NSLocalizedString("unknown error",
                                     comment: "unknown error")
        }
    }
}
