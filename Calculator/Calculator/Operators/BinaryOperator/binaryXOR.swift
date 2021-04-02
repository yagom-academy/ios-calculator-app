//
//  binaryXOR.swift
//  Calculator
//
//  Created by 강경 on 2021/04/02.
//

import Foundation

extension CalculateBinaryNumber {
  func binaryXOR(_ firstOperands: Stack<Int>, _ secondOperands: Stack<Int>) -> Int {
    var results:[String] = []
    
    for _ in 1...9 {
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
      
      results.insert("\(firstOperand ^ secondOperand)", at: 0)
    }
    
    let resultString = results.joined()
    result = Int(resultString)!

    return result
  }
}
