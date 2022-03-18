//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by song on 2022/03/15.
//

import Foundation

struct CalculateItemQueue<T: CalculateItem> {
  var list = LinkedList<T>()
  
  func enqueue(data: T) {
    list.append(data: data)
  }
  
  func dequeue() -> T? {
    list.removeFirst()
  }
  
  func dequeueLatest() {
    list.removeLatest()
  }
  
  func dequeueAll() {
    list.removeAll()
  }
  
  func presentAll() -> [T] {
   return list.showAll()
  }
}
