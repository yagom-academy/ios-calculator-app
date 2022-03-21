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
      return "숫자잘못입력"
    case .nonOperator:
      return "기호잘못입력"
    }
  }
}
