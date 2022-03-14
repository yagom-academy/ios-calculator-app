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
    guard self.elements.isEmpty == false else {
      return nil
    }
    return self.elements.removeFirst()
  }
}
