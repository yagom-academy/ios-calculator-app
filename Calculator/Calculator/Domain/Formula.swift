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
  
  func result() -> Double {
    return 3.0
  }
}
