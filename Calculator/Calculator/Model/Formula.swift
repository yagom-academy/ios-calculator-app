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
  
  func result() -> Result<Double,CalculatorError> {
    
    guard var result = operands.dequeue() else {
      return .failure(.nonNumber)
    }
  
    while let operand = operands.dequeue(), let `operator` = operators.dequeue() {

      if `operator` == Operator.divide && operand == Double.zero {
        return .failure(.divisionByZero)
      }
      
      result = `operator`.calculate(lhs: result, rhs: operand)
    }
    return .success(result)
  }
}
