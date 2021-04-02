//
//  binaryOR.swift
//  Calculator
//
//  Created by 강경 on 2021/04/02.
//

import Foundation

extension CalculateBinaryNumber {
  func binaryOR(_ firstOperands: Stack<Int>, _ secondOperands: Stack<Int>) -> Int {
    var arr: Array<String> = []
    var stringResult = String()
    
    while !firstOperands.isEmpty() || !secondOperands.isEmpty() {
      if !firstOperands.isEmpty() && !secondOperands.isEmpty() {
        if firstOperands.peek()! == 1 || secondOperands.peek()! == 1 {
          arr.insert("1", at: 0)
          firstOperands.pop()
          secondOperands.pop()
        } else {
          arr.insert("0", at: 0)
          firstOperands.pop()
          secondOperands.pop()
        }
      } else if !firstOperands.isEmpty() {
        if firstOperands.peek() == 1 {
          arr.insert("1", at: 0)
          firstOperands.pop()
        } else if firstOperands.peek() == 0 {
          arr.insert("0", at: 0)
          firstOperands.pop()
        }
      } else if !secondOperands.isEmpty() {
        if secondOperands.peek() == 1 {
          arr.insert("1", at: 0)
          secondOperands.pop()
        } else if secondOperands.peek() == 0 {
          arr.insert("0", at: 0)
          secondOperands.pop()
        }
      }
    }
    for element in arr {
      stringResult += element
    }
    result = Int(stringResult)!
    return result
  }
}
