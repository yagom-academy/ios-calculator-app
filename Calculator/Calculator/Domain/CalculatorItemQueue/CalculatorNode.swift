//
//  CalculatorNode.swift
//  Calculator
//
//  Created by Lingo on 2022/03/15.
//

import Foundation

final class CalculatorNode<Element: CalculateItem> {
  
  var data: Element
  var next: CalculatorNode?
  
  init(_ data: Element) {
    self.data = data
  }
}
