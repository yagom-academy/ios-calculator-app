//
//  OperationError.swift
//  Calculator
//
//  Created by 이차민 on 2021/11/12.
//

import Foundation

enum OperationError: Error {
    case dividedByZero
}

extension OperationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .dividedByZero:
            return "0으로 나누는 경우 값이 NaN입니다."
        }
    }
}
