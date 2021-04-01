//
//  Stack.swift
//  Calculator
//
//  Created by 강경 on 2021/04/01.
//

import Foundation

class Stack {
  private var array: [Int] = []
  
  private func checkCount() throws {
    if array.endIndex >= 10
    || array.endIndex < 0 {
      throw StackError.exceedRangeOfStack
    }
  }
  
  func peek() -> Int? {
    if array.endIndex < 1 {
      return nil
    } else {
      return array[array.endIndex - 1]
    }
  }
  
  func push(number: Int) throws {
    try checkCount()
    
    array.append(number)
  }
  
  func pop() throws {
    try checkCount()
    
    array.removeLast()
  }
  
  func Initialization() {
    array.removeAll()
  }
}
