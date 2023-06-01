//
//  CalculationError.swift
//  Calculator
//
//  Created by Minsup on 2023/05/31.
//

enum CalculationError: Error {
    case divisionByZero
    case notFoundOperand
    case notFoundOperator
    case invalidInputNumber
    case invalidInputPoint
}
