//
//  OperatorErrors.swift
//  Calculator
//
//  Created by MARY on 2023/06/05.
//

import Foundation

enum OperatorErrors {
    case notDivisibleByZero
}

extension OperatorErrors: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notDivisibleByZero:
            return "0으로 나눌 수 없습니다."
        }
    }
}
