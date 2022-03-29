//
//  CalculatorError.swift
//  Calculator
//
//  Created by 이시원 on 2022/03/23.
//

import Foundation

enum CalauletorError: Error {
    case dividedByZero
    case invalidInputValue
    case cannotCalculation
    case operandIsNil
    case operatorIsNil
}
