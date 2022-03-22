//
//  ExpressionParser.swift
//  Calculator
//
//  Created by song on 2022/03/19.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
      split(separator: target).map{ String($0) }
    }
}

enum ExpressionParser {
  
  static func parse(from input: String) -> Formula {
    let fomula = Formula()
    
    input.split(with: " ")
      .compactMap { Double($0) }
      .forEach { fomula.operands.enqueue(data: $0) }
    
    componentsByOperators(from: input)
      .compactMap { Operator(rawValue: Character($0)) }
      .forEach { fomula.operators.enqueue(data: $0) }
    
    return fomula
  }
  
  private static func componentsByOperators(from input: String) -> [String] {
    input.split(with: " ").filter { Double($0) == nil }
  }
}
