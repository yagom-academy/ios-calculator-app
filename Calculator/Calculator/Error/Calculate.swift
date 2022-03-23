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
