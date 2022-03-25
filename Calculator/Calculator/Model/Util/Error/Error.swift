//
//  Error.swift
//  Calculator
//
//  Created by song on 2022/03/21.
//

import Foundation

enum CalculatorError: Error {
  case divisionByZero
  case nonNumber
  case nonOperator
}

extension CalculatorError: LocalizedError {
  var errorDescription: String?{
    switch self {
    case .divisionByZero:
      return "NaN"
    case .nonNumber:
      return "numberError"
    case .nonOperator:
      return "operatorError"
    }
  }
}
