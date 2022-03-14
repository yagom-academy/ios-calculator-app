//
//  CalculatorLinkedList.swift
//  Calculator
//
//  Created by Lingo on 2022/03/15.
//

import Foundation

final class CalculatorLinkedList<Element> {
  var count = 0
  
  func append(_ data: Element) {
    self.count += 1
  }
}
