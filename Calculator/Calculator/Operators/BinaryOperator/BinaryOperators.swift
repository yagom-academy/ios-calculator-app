//
//  BinaryOperators.swift
//  Calculator
//
//  Created by 강경 on 2021/04/01.
//

import Foundation

enum BinaryOperators: String {
  case Plus = "+"
  case Minus = "-"
  case AND = "&"
  case NAND = "~&"
  case OR = "|"
  case NOR = "~|"
  case XOR = "^"
  case NOT = "~"
  case LeftShift = "<<"
  case RightShift = ">>"
}

extension CalculateBinaryNumber {
  func plus(_ firstOperands: Int, _ secondOperands: Int) -> Int {
    return firstOperands + secondOperands
  }
  
  func minus(_ firstOperands: Int, _ secondOperands: Int) -> Int {
    return firstOperands - secondOperands
  }
  
  func AND(_ firstOperands: Int, _ secondOperands: Int) -> Int {
    return firstOperands & secondOperands
  }
  
  func NAND(_ firstOperands: Int, _ secondOperands: Int) -> Int {
    // 수정
    return firstOperands / secondOperands
  }
  
  func OR(_ firstOperands: Int, _ secondOperands: Int) -> Int {
    return firstOperands | secondOperands
  }
  
  func NOR(_ firstOperands: Int, _ secondOperands: Int) -> Int {
    // 수정
    return firstOperands * secondOperands
  }
  
  func XOR(_ firstOperands: Int, _ secondOperands: Int) -> Int {
    return firstOperands ^ secondOperands
  }
  
  func NOT(_ operand: Int) -> Int {
    return ~operand
  }
  
  func leftShift(_ operand: Int) -> Int {
    return operand << 1
  }
  
  func rightShift(_ operand: Int) -> Int {
    return operand >> 1
  }
}
