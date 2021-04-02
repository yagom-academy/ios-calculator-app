//
//  binaryPlus.swift
//  Calculator
//
//  Created by 강경 on 2021/04/02.
//

import Foundation

extension CalculateBinaryNumber {
  func binaryPlus(_ firstOperands: Stack<Int>, _ secondOperands: Stack<Int>) -> Int {
    var results:[String] = []
    var carry = 0
    
    for _ in 1...9 {
      var isCarryOccur = false
      
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
      if (firstOperand == 1 && secondOperand == 1)
      || (sum == 1 && carry == 1){
        isCarryOccur = true
      }
      sum ^= carry
      
      if isCarryOccur {
        carry = 1
      } else {
        carry = 0
      }
      results.insert("\(sum)", at: 0)
    }
    
    let resultString = results.joined()
    result = Int(resultString)!

    return result
  }
}
