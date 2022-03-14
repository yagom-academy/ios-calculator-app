//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Lingo on 2022/03/14.
//

import Foundation

final class CalculatorItemQueue<Element> {
  var elements: [Element] = []
  
  func enqueue(data: Element) {
    self.elements.append(data)
  }
  
  func dequeue() -> Element? {
    guard self.isEmpty() == false else {
      return nil
    }
    return self.elements.removeFirst()
  }
  
  func peek() -> Element? {
    return self.elements.first
  }
  
  func clear() {
    self.elements.removeAll()
  }
  
  func isEmpty() -> Bool {
    return self.elements.isEmpty
  }
}
