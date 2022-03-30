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
    return list.append(data: data)
  }
  
  func dequeue() -> T? {
    return list.removeFirst()
  }
  
  func dequeueLatest() {
    return list.removeLatest()
  }
  
  func dequeueAll() {
    return list.removeAll()
  }
  
  func presentAll() -> [T] {
    return list.showAll()
  }
  
  func isEmpty() -> Bool {
    return list.isEmpty
  }
}
