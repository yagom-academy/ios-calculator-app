//
//  OperatorError.swift
//  Calculator
//
//  Created by bard, hugh on 2022/05/30.
//

import Foundation

enum OperatorError: LocalizedError {
    case devideFail
    case unknown
}

extension OperatorError {
    var errorDescription: String {
        switch self {
        case .devideFail:
            return NSLocalizedString("NaN",
                                     comment: "devide error")
        case .unknown:
            return NSLocalizedString("unknown error",
                                     comment: "unknown error")
        }
    }
}
