//
//  leftShift.swift
//  Calculator
//
//  Created by 강경 on 2021/04/02.
//

import Foundation

extension CalculateBinaryNumber {
  func leftShift(_ operands: Stack<Int>) -> Int {
    var results:[String] = []
    
    results.insert("0", at: 0)
    for _ in 1...8 {
      var operand = 0
      if !operands.isEmpty() {
        operand = operands.peek()!
        operands.pop()
      }
      
      results.insert("\(operand)", at: 0)
    }
    
    let resultString = results.joined()
    result = Int(resultString)!

    return result
  }
}
