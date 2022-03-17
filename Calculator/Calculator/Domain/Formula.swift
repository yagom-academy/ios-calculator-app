//
//  Formula.swift
//  Calculator
//
//  Created by Lingo on 2022/03/17.
//

import Foundation

struct Formula {
  var operands: CalculatorItemQueue<Double> = .init()
  var operators: CalculatorItemQueue<Operator> = .init()
  
  mutating func result() -> Double {
    guard var total = self.operands.dequeue(),
          self.operands.count == self.operators.count
    else {
      return .zero
    }
    while let operand = self.operands.dequeue(), let operatorType = self.operators.dequeue() {
      total = operatorType.calculate(lhs: total, rhs: operand)
    }
    return total
  }
}
