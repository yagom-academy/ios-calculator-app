//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Lingo on 2022/03/14.
//

import Foundation

struct CalculatorItemQueue<Element: CalculateItem> {
  private(set) var elements: [Element] = []
  
  mutating func enqueue(data: Element) {
    self.elements.append(data)
  }
  
  mutating func dequeue() -> Element? {
    guard self.isEmpty() == false else {
      return nil
    }
    return self.elements.removeFirst()
  }
  
  func peek() -> Element? {
    return self.elements.first
  }
  
  mutating func clear() {
    self.elements.removeAll()
  }
  
  func isEmpty() -> Bool {
    return self.elements.isEmpty
  }
  
  func count() -> Int {
    return self.elements.count
  }
}
