//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Lingo on 2022/03/18.
//

enum ExpressionParser {
  
  static func parse(from input: String) -> Formula {
    var formula = Formula()
    let result = self.componentsByOperators(from: input)
    result
      .compactMap { Double($0) }
      .forEach { formula.operands.enqueue($0) }
    result
      .filter { Double($0) == nil }
      .compactMap { Operator(rawValue: Character($0)) }
      .forEach { formula.operators.enqueue($0) }
    return formula
  }
  
  private static func componentsByOperators(from input: String) -> [String] {
    return input
      .split(with: " ")
      .filter { $0.isEmpty == false }
  }
}
