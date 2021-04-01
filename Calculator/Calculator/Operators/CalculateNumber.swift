//
//  CalculateNumber.swift
//  Calculator
//
//  Created by 강경 on 2021/04/01.
//

import Foundation

enum NumeralSystem: Int {
  case Decimal = 1
  case Binary = 2
}

class CalculateNumber {
  func calculate(_ operands: Stack<Int>, _ operators: Stack<String>) -> Int {
    var result: Int = 0
    var isRepeat = true
    repeat {
      guard let `operator` = operators.peek() else {
        isRepeat = false
        break
      }
      operators.pop()
      guard let firstOperand = operands.peek() else {
        isRepeat = false
        break
      }
      operands.pop()
      
      guard let secondOperand = operands.peek()  else {
        isRepeat = false
        break
      }
      
      if `operator` != BinaryOperators.NOT.rawValue
      && `operator` != BinaryOperators.LeftShift.rawValue
      && `operator` != BinaryOperators.RightShift.rawValue {
        operands.pop()
      }
      
      do {
        result = try calculateByOperator(`operator`, firstOperand, secondOperand)
      } catch {
        print(error)
      }
      
      if operands.isEmpty() {
        isRepeat = false
      } else {
        operands.push(result)
      }
    } while isRepeat
    
    return result
  }
  
  func calculateByOperator(_ operator: String,
                           _ firstOperand: Int,
                           _ secondsOperand: Int) throws -> Int {
    return 0
  }
}
