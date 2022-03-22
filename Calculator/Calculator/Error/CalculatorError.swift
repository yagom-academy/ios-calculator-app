//
//  CalculatorError.swift
//  Calculator
//
//  Created by 조민호 on 2022/03/18.
//

import Foundation

enum CalculatorError: Error {
    case dividedByZero
}

extension CalculatorError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .dividedByZero:
            return "0으로 나누는 경우 결과값은 NaN으로 표기됩니다."
        }
    }
}
