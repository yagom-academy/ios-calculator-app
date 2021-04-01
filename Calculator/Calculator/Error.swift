//
//  Error.swift
//  Calculator
//
//  Created by 강경 on 2021/04/01.
//

import Foundation

enum StackError: Error, CustomStringConvertible {
  case exceedRangeOfStack
  
  var description: String {
    switch self {
    case .exceedRangeOfStack:
      return "Stack의 범위를 초과하였습니다."
    }
  }
}

enum CalculateByOperatorError: Error, CustomStringConvertible {
  case cantNotMatchStrinngToDecimalOperators
  case cantNotMatchStrinngToBinaryOperators
  case cantNotDivideByZero
  
  var description: String {
    switch self {
    case .cantNotMatchStrinngToDecimalOperators:
      return "해당하는 10진수 연산자가 없습니다."
    case .cantNotMatchStrinngToBinaryOperators:
      return "해당하는 2진수 연산자가 없습니다."
    case .cantNotDivideByZero:
      return "0으로는 나눌 수 없습니다."
    }
  }
}
