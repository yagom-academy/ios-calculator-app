//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Lingo on 2022/03/14.
//

import Foundation

struct CalculatorItemQueue<Element: CalculateItem> {

  private var list: CalculatorLinkedList<Element>
  
  var elements: [Element?] {
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
  
  init(list: CalculatorLinkedList<Element> = CalculatorLinkedList<Element>()) {
    self.list = list
  }
  
  mutating func enqueue(_ data: Element) {
    self.list.append(data)
  }
  
  mutating func dequeue() -> Element? {
    guard self.isEmpty == false else {
      return nil
    }
    return self.list.removeFirst()
  }
  
  mutating func clear() {
    self.list.removeAll()
  }
}
