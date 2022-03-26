//
//  Formula.swift
//  Calculator
//
//  Created by Lingo on 2022/03/17.
//

import Foundation

struct Formula {
  
  var operands = CalculatorItemQueue<Double>()
  var operators = CalculatorItemQueue<Operator>()
  
  mutating func result() throws -> Double {
    guard var total = self.operands.dequeue(),
          self.operands.count == self.operators.count
    else {
      throw FormulaError.inValidFormula
    }
    while let operand = self.operands.dequeue(), let operatorType = self.operators.dequeue() {
      total = operatorType.calculate(lhs: total, rhs: operand)
    }
    return total
  }
}
