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
  
  init(list: CalculatorLinkedList<Element> = CalculatorLinkedList<Element>()) {
    self.list = list
  }
  
  mutating func enqueue(data: Element) {
    self.list.append(data)
  }
  
  mutating func dequeue() -> Element? {
    guard self.isEmpty == false else {
      return nil
    }
    return self.list.removeFirst()
  }
  
  func peek() -> Element? {
    return self.list.first
  }
  
  mutating func clear() {
    self.list.removeAll()
  }
}
