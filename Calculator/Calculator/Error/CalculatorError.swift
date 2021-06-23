//
//  CalculatorError.swift
//  Calculator
//
//  Created by JINHONG AN on 2021/06/23.
//

import Foundation

enum CalculatorError: Error, LocalizedError {
    case divideByZero
    
    var errorDescription: String? {
        switch self {
        case .divideByZero:
            return "0으로 나눌 수 없습니다."
        }
    }
}
