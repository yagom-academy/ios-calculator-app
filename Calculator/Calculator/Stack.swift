//
//  Stack.swift
//  Calculator
//
//  Created by 강경 on 2021/04/01.
//

import Foundation

struct Stack {
  // Array(repeating:count:) 메서드는 반복할 값 1개(repeating)가 지정된 횟수(count)만큼 배열에 넣어집니다.
  private var array = Array(repeating: 0, count: 9)
  private var positionOfElement = 0
  
  private func checkCount() throws {
    if positionOfElement >= 10
    || positionOfElement < 0 {
      throw StackError.exceedRangeOfStack
    }
  }
  
  mutating func push(number: Int) throws {
    try checkCount()
    
    array[positionOfElement] = number
    positionOfElement += 1
  }
  
  mutating func pop() throws {
    try checkCount()
    
    array[positionOfElement] = 0
    positionOfElement -= 1
  }
  
  mutating func Initialization() {
    array = Array(repeating: 0, count: 9)
  }
}
