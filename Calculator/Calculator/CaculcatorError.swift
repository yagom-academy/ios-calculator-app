//
//  CaculcatorError.swift
//  Calculator
//
//  Created by Yeon on 2020/12/07.
//

enum CalculatorError: Error {
    case overflow
    case divideByZero
    case stackIsEmpty
    case unknown
}
