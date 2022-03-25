//  Error.swift
//  Calculator
//  Created by LIMGAUI on 2022/03/20

import Foundation

enum CalculateError: Error {
    case isNaN(Double)
    case operandIsNil
    case operatorIsNil
    case cannotCalculation
}

extension CalculateError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .isNaN(_):
            return "NaN"
        case .operandIsNil:
            return "operandIsNil"
        case .operatorIsNil:
            return "operatorIsNil"
        case .cannotCalculation:
            return "cannotCalculation"
        }
    }
}
