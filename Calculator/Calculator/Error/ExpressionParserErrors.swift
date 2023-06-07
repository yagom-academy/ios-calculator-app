//
//  ExpressionParserErrors.swift
//  Calculator
//
//  Created by MARY on 2023/06/05.
//

import Foundation

enum ExpressionParserErrors {
    case invalidOperands
}

extension ExpressionParserErrors: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidOperands:
            return "유효하지 않은 숫자입니다."
        }
    }
}
