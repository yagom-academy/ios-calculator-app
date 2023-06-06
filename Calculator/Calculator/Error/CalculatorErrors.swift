//
//  Errors.swift
//  Calculator
//
//  Created by minsong kim on 2023/06/06.
//

import Foundation

enum CalculatorErrors: Error {
    case divideByZero
    case moreOperator
    case emptyQueue
}
