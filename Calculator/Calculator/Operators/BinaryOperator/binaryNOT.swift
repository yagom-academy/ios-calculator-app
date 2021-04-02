//
//  binaryNOT.swift
//  Calculator
//
//  Created by 강경 on 2021/04/02.
//

import Foundation

extension CalculateBinaryNumber {
  func binaryNOT(_ operands: Stack<Int>) -> Int {
    var results:[String] = []
        
    for _ in 1...9 {
      var operand = 0
      if !operands.isEmpty() {
        operand = operands.peek()!
        operands.pop()
      }
            
      if operand == 0 {
        operand = 1
      } else {
        operand = 0
      }

      results.insert("\(operand)", at: 0)
    }
    
    let resultString = results.joined()
    result = Int(resultString)!

    return result
  }
}
