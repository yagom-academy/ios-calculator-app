//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Lingo on 2022/03/14.
//

import Foundation

struct CalculatorItemQueue<Element: CalculateItem> {

  private(set) var list: CalculatorLinkedList<Element> = .init()
  
  var elements: [Element] {
    return self.list.allElements()
  }
  
  var count: Int {
    return self.list.count
  }
  
  var isEmpty: Bool {
    return self.list.isEmpty
  }
  
  var first: Element? {
    return self.list.first
  }
  
  mutating func enqueue(_ data: Element) {
    self.list.append(data)
  }
  
  mutating func dequeue() -> Element? {
    guard self.list.isEmpty == false else {
      return nil
    }
    return self.list.removeFirst()
  }
  
  mutating func clear() {
    self.list.removeAll()
  }
}
