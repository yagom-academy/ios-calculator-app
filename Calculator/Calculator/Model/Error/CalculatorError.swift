//
//  CalculatorError.swift
//  Calculator
//
//  Created by SeoDongyeon on 2022/03/18.
//

import Foundation

enum CalculatorError: Error {
    case divideByZero

    var description: String {
        switch self {
        case .divideByZero:
            return "NaN"
        }
    }
}
