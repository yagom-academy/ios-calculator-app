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
    return nil
  }
}
