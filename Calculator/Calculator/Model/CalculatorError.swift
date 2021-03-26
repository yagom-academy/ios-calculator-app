//
//  CalculatorError.swift
//  jebal
//
//  Created by 이영우 on 2021/03/26.
//

import Foundation

enum CalculatorError: Error {
    case invalidOperator
}

extension CalculatorError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidOperator:
            return NSLocalizedString("해당 계산기에 유효하지 않는 연산자입니다", comment: "My error")
        }
    }
}
