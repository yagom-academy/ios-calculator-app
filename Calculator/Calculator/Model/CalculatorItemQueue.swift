//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by song on 2022/03/15.
//

import Foundation

class CalculateItemQueue<T>: CalculateItem {
  var list = LinkedList<T>()
  
  func enqueue(data: T) {
    list.append(data: data)
  }
  
  func dequeue() {
    list.removeHead()
  }
  
  func dequeueAll() {
    list.removeAll()
  }
  
  func presentAll() -> [T]{
   return list.showAll()
  }
  
}
