//
//  DecimalOperators.swift
//  Calculator
//
//  Created by 강경 on 2021/04/01.
//

import Foundation

enum DecimalOperators: String, Comparable {
  static func < (operator1: DecimalOperators, operator2: DecimalOperators) -> Bool {
    if (operator1 == .Plus || operator1 == .Minus)
    && (operator2 == .Multiplication || operator2 == .Divide) {
      return true
    } else {
      return false
    }
  }
  
  case Plus = "+"
  case Minus = "-"
  case Multiplication = "*"
  case Divide = "/"
}

extension CalculateDecimalNumber {
  func plus(_ firstOperands: Int, _ secondOperands: Int) -> Int {
    return firstOperands + secondOperands
  }
  
  func minus(_ firstOperands: Int, _ secondOperands: Int) -> Int {
    return firstOperands - secondOperands
  }
  
  func multiplication(_ firstOperands: Int, _ secondOperands: Int) -> Int {
    return firstOperands * secondOperands
  }
  
  func divide(_ firstOperands: Int, _ secondOperands: Int) -> Int {
    return firstOperands / secondOperands
  }
}
