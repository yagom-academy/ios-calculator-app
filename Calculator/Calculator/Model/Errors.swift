//
//  Errors.swift
//  Calculator
//
//  Created by 이예원 on 2021/06/28.
//

import Foundation

enum ArithmeticError: Error {
    case downCastingError
}

enum StackError: Error {
    case underflow
}

enum CalculatorError: Error {
    case zeroDivisor
}

enum CalculatorViewControllerError: Error {    
    case emptyUIDigitsLabel
    case alreadyHaveADot
    case couldNotConvertToDouble
    case couldNotChangeSymbolCauseNaN
    case couldNotChangeSymbolCauseZero
    case alreadyPerformedCalculation
    case couldNotConvertToStringFromNumberFormatter
}
