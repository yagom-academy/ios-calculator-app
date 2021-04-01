//
//  Stack.swift
//  Calculator
//
//  Created by 강경 on 2021/04/01.
//

import Foundation

class Stack<T> {
  private var array: [T] = []
  
  func peek() -> T? {
    if array.isEmpty {
      return nil
    } else {
      return array[array.endIndex - 1]
    }
  }
  
  func push(_ element: T) {
    array.append(element)
  }
  
  func pop() {
    array.removeLast()
  }
  
  func popAllElements() {
    array.removeAll()
  }
  
  func isEmpty() -> Bool {
    if array.isEmpty {
      return true
    } else {
      return false
    }
  }
}
