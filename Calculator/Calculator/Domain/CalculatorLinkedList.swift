//
//  CalculatorLinkedList.swift
//  Calculator
//
//  Created by Lingo on 2022/03/15.
//

import Foundation

struct CalculatorLinkedList<Element: CalculateItem> {
  
  private(set) var front: CalculatorNode<Element>?
  private(set) var rear: CalculatorNode<Element>?
  private(set) var count = Int.zero
  
  var first: Element? {
    return self.front?.data
  }
  
  var isEmpty: Bool {
    return self.front == nil
  }
  
  mutating func append(_ data: Element) {
    let newNode = CalculatorNode(data)
    if self.isEmpty {
      self.front = newNode
      self.rear = newNode
      self.count += 1
      return
    }
    self.rear?.next = newNode
    self.rear = newNode
    self.count += 1
  }
  
  mutating func removeFirst() -> Element? {
    let data = self.front?.data
    self.front = self.front?.next
    self.count -= 1
    return data
  }
  
  mutating func removeAll() {
    self.front = nil
    self.rear = nil
    self.count = Int.zero
  }

  func allElements() -> [Element] {
    var result: [Element] = []
    var current = self.front
    while let node = current {
      result.append(node.data)
      current = node.next
    }
    return result
  }
}
