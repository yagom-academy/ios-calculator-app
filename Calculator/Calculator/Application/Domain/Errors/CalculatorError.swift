//
//  CalculatorError.swift
//  Calculator
//
//  Created by Gordon Choi on 2022/05/23.
//

import Foundation

enum CalculatorError: Error {
    case noRemainingValue
    
    var errorDescription: String {
        switch self {
        case .noRemainingValue:
            return "더 이상 계산할 값이 없습니다."
        }
    }
}
