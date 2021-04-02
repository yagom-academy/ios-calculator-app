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
      return binaryPlus(firstOperands, secondOperands)
    case .Minus:
      return binaryMinus(firstOperands, secondOperands)
    case .AND:
      return binaryAND(firstOperands, secondOperands)
    case .NAND:
      return binaryNAND(firstOperands, secondOperands)
    case .OR:
      return binaryOR(firstOperands, secondOperands)
    case .NOR:
      return binaryNOR(firstOperands, secondOperands)
    case .XOR:
      return binaryXOR(firstOperands, secondOperands)
    case .NOT:
      return binaryNOT(firstOperands)
    case .LeftShift:
      return leftShift(firstOperands)
    case .RightShift:
      return rightShift(firstOperands)
    }
  }
}
