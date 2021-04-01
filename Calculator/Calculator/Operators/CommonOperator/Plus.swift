//
//  Plus.swift
//  Calculator
//
//  Created by 강경 on 2021/04/01.
//

import Foundation

extension Operator {
  func plus(_ firstOperands: Stack, _ secondOperands: Stack) -> [Int] {
    var result: [Int] = []
    var isRepeat = true
    
    repeat {
      var firstOperand = firstOperands.peek()
      var secondOperand = secondOperands.peek()
      if firstOperand == nil && secondOperand == nil {
        isRepeat = false
        break
      }

      if firstOperand == nil {
        firstOperand = 0
      }
      if secondOperand == nil {
        secondOperand = 0
      }

      let number = firstOperand! + secondOperand!

      if result.endIndex == 0 {
        result.append(number / 10)
      } else {
        result[result.endIndex - 1] += number / 10
      }
      
      result.append(number % 10)
        
      do {
        try firstOperands.pop()
        try secondOperands.pop()
      } catch {
        print(error)
      }
    } while isRepeat
    
    return result
  }
}
