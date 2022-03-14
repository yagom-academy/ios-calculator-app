//
//  CalculatorLinkedList.swift
//  Calculator
//
//  Created by Lingo on 2022/03/15.
//

import Foundation

final class CalculatorLinkedList<Element> {
  private(set) var front: CalculatorNode<Element>?
  private(set) var rear: CalculatorNode<Element>?
  private(set) var count = 0
  
  var first: Element? {
    return self.isEmpty ? nil : self.front?.data
  }
  
  var isEmpty: Bool {
    return self.count == Int.zero ? true : false
  }
  
  func append(_ data: Element) {
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
  
  func removeFirst() -> Element? {
    let data = self.front?.data
    self.front = self.front?.next
    self.count -= 1
    return data
  }
  
  func removeAll() {
    self.front = nil
    self.rear = nil
    self.count = 0
  }
}
