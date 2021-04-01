//
//  CalculateDecimalNumber.swift
//  Calculator
//
//  Created by 강경 on 2021/04/01.
//

import Foundation

class CalculateDecimalNumber: CalculateNumber {
  override func calculateByOperator(_ operator: String,
                                    _ firstOperand: Int,
                                    _ secondOperand: Int) throws -> Int {
    guard let decimalOperator = DecimalOperators(rawValue: `operator`) else {
      throw CalculateByOperatorError.cantNotMatchStrinngToDecimalOperators
    }
    
    switch decimalOperator {
    case .Plus:
      return plus(firstOperand, secondOperand)
    case .Minus:
      return minus(firstOperand, secondOperand)
    case .Multiplication:
      return multiplication(firstOperand, secondOperand)
    case .Divide:
      if firstOperand < 1 {
        throw CalculateByOperatorError.cantNotDivideByZero
      }
      return divide(firstOperand, secondOperand)
    }
  }
}
