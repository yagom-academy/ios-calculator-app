//
//  binaryAND.swift
//  Calculator
//
//  Created by 강경 on 2021/04/02.
//

import Foundation

extension CalculateBinaryNumber {
  func binaryAND(_ firstOperands: Stack<Int>, _ secondOperands: Stack<Int>) -> Int {
    let resultStack = Stack<Int>()
    var resultString = ""
    
    while !firstOperands.isEmpty() || !secondOperands.isEmpty() {
      if (firstOperands.peek() == 1) && (secondOperands.peek() == 1) {
        resultStack.push(1)
      } else {
        resultStack.push(0)
      }
      
      if firstOperands.isEmpty() {
        firstOperands.push(0)
      } else {
        secondOperands.push(0)
      }
      firstOperands.pop()
      secondOperands.pop()
    }
    
    while !resultStack.isEmpty() {
      resultString += "\(resultStack.peek()!)"
      resultStack.pop()
    }
    
    return Int(resultString)!
  }
}
