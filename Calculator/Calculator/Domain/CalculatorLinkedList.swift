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
  var count = 0
  
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
}
