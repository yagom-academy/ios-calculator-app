//
//  BinaryOperators.swift
//  Calculator
//
//  Created by 강경 on 2021/04/01.
//

import Foundation

enum BinaryOperators: String, Comparable {
  static func < (operator1: BinaryOperators, operator2: BinaryOperators) -> Bool {
    if (operator1 == .Plus || operator1 == .Minus || operator1 == .AND || operator1 == .NAND
          || operator1 == .OR || operator1 == .NOR || operator1 == .XOR)
    && (operator2 == .NOT || operator2 == .LeftShift || operator2 == .RightShift) {
      return true
    } else {
      return false
    }
  }
  
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
  func plus(_ firstOperands: Stack<Int>, _ secondOperands: Stack<Int>) -> Int {
    var results:[Int] = []
    var carry = 0
    var isRepeat = true
    
    while isRepeat {
      if firstOperands.isEmpty() && secondOperands.isEmpty() {
        isRepeat = false
        break
      }
      
      var firstOperand = 0
      if !firstOperands.isEmpty() {
        firstOperand = firstOperands.peek()!
        firstOperands.pop()
      }
      
      var secondOperand = 0
      if !secondOperands.isEmpty() {
        secondOperand = secondOperands.peek()!
        secondOperands.pop()
      }
      
      var sum = firstOperand ^ secondOperand
      sum ^= carry
      results.insert(sum, at: 0)
      
      if firstOperand == 1 && secondOperand == 1 {
        carry = 1
      } else {
        carry = 0
      }
    }
    
    // convert integer array to an integer
    var resultString = ""
    _ = results.map{ resultString = resultString + "\($0)" }
    result = Int(resultString)!

    return result
  }
  
  func minus(_ firstOperands: Stack<Int>, _ secondOperands: Stack<Int>) -> Int {
    
    // result = 여기에 결과 값을 넣어주세요
    return result
  }
  
  func AND(_ firstOperands: Stack<Int>, _ secondOperands: Stack<Int>) -> Int {
    
    // result = 여기에 결과 값을 넣어주세요
    return result
  }
  
  func NAND(_ firstOperands: Stack<Int>, _ secondOperands: Stack<Int>) -> Int {
    
    // result = 여기에 결과 값을 넣어주세요
    return result
  }
  
  func OR(_ firstOperands: Stack<Int>, _ secondOperands: Stack<Int>) -> Int {
    
    // result = 여기에 결과 값을 넣어주세요
    return result
  }
  
  func NOR(_ firstOperands: Stack<Int>, _ secondOperands: Stack<Int>) -> Int {
    
    // result = 여기에 결과 값을 넣어주세요
    return result
  }
  
  func XOR(_ firstOperands: Stack<Int>, _ secondOperands: Stack<Int>) -> Int {
    
    // result = 여기에 결과 값을 넣어주세요
    return result
  }
  
  func NOT(_ operand: Stack<Int>) -> Int {
    
    // result = 여기에 결과 값을 넣어주세요
    return result
  }
  
  func leftShift(_ operand: Stack<Int>) -> Int {
    
    // result = 여기에 결과 값을 넣어주세요
    return result
  }
  
  func rightShift(_ operand: Stack<Int>) -> Int {
    
    // result = 여기에 결과 값을 넣어주세요
    return result
  }
}
