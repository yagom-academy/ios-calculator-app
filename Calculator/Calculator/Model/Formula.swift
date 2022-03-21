//
//  Formula.swift
//  Calculator
//
//  Created by song on 2022/03/19.
//

import Foundation

struct Formula {
  var operands = CalculateItemQueue<Double>()
  var operators = CalculateItemQueue<Operator>()
  
  func result() -> Double {
    
    guard var result = operands.dequeue() else {
      return 0
    }
  
    while operands.isEmpty() == false {

      guard let operand = operands.dequeue()  else {
        return result
      }
      guard let `operator` = operators.dequeue() else {
       return result
      }
      result = `operator`.calculate(lhs: result, rhs: operand)
    }
    return result
  }
}
