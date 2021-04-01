//
//  CalculateBinaryNumber.swift
//  Calculator
//
//  Created by 강경 on 2021/04/01.
//

import Foundation

class CalculateBinaryNumber: CalculateNumber {
  override func calculateByOperator(_ operator: String,
                                    _ firstOperand: Int,
                                    _ secondOperand: Int = 0) throws -> Int {
    guard let binaryOperator = BinaryOperators(rawValue: `operator`) else {
      throw CalculateByOperatorError.cantNotMatchStringToBinaryOperators
    }

    switch binaryOperator {
    case .Plus:
      return plus(firstOperand, secondOperand)
    case .Minus:
      return minus(firstOperand, secondOperand)
    case .AND:
      return AND(firstOperand, secondOperand)
    case .NAND:
      return NAND(firstOperand, secondOperand)
    case .OR:
      return OR(firstOperand, secondOperand)
    case .NOR:
      return NOR(firstOperand, secondOperand)
    case .XOR:
      return XOR(firstOperand, secondOperand)
    case .NOT:
      return NOT(firstOperand)
    case .LeftShift:
      return leftShift(firstOperand)
    case .RightShift:
      return rightShift(firstOperand)
    }
  }
}
