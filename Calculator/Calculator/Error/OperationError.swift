//
//  OperationError.swift
//  Calculator
//
//  Created by 이승재 on 2021/11/10.
//

import Foundation

enum OperationError: Error {
    case devidedByZero
}

extension OperationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .devidedByZero:
            return "0으로 나눌 수 없습니다."
        }
    }
}
