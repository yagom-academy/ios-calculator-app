//
//  CalculateBinaryNumber.swift
//  Calculator
//
//  Created by 강경 on 2021/04/01.
//

import Foundation

extension StringProtocol  {
    var digits: [Int] { compactMap(\.wholeNumberValue) }
}

class CalculateBinaryNumber: CalculateNumber {
  var result = 0
  
  override func calculateByOperator(_ operator: String,
                                    _ firstOperand: Int,
                                    _ secondOperand: Int = 0) throws -> Int {
    guard let binaryOperator = BinaryOperators(rawValue: `operator`) else {
      throw CalculateByOperatorError.cantNotMatchStringToBinaryOperators
    }
    
    // 다른 처리방법 없을지 질문
    let firstOperands = Stack<Int>()
    let firstOperandArray = "\(firstOperand)".digits
    for firstOperandNumber in firstOperandArray {
      firstOperands.push(firstOperandNumber)
    }
    
    let secondOperands = Stack<Int>()
    let secondOperandArray = "\(secondOperand)".digits
    for secondOperandNumber in secondOperandArray {
      secondOperands.push(secondOperandNumber)
    }

    switch binaryOperator {
    case .Plus:
      return plus(firstOperands, secondOperands)
    case .Minus:
      return minus(firstOperands, secondOperands)
    case .AND:
      return AND(firstOperands, secondOperands)
    case .NAND:
      return NAND(firstOperands, secondOperands)
    case .OR:
      return OR(firstOperands, secondOperands)
    case .NOR:
      return NOR(firstOperands, secondOperands)
    case .XOR:
      return XOR(firstOperands, secondOperands)
    case .NOT:
      return NOT(firstOperands)
    case .LeftShift:
      return leftShift(firstOperands)
    case .RightShift:
      return rightShift(firstOperands)
    }
  }
}
