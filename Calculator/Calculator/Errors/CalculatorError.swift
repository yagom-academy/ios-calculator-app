//
//  CalculatorError.swift
//  Calculator
//
//  Created by 이원빈 on 2022/05/27.
//

import Foundation

enum CalculatorError: Error {
    case emptyStack
    case notEnoughInput
    case dividedByZero
}
