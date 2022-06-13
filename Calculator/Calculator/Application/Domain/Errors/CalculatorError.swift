//
//  CalculatorError.swift
//  Calculator
//
//  Created by 나이든별, 민쏜
//

import Foundation

enum CalculatorError: Error {
    case noRemainingValue
    case dividedByZero
    
    var errorDescription: String {
        switch self {
        case .noRemainingValue:
            return "더 이상 계산할 값이 없습니다."
        case .dividedByZero:
            return "0으로 나눌 수 없습니다."
        }
    }
}
