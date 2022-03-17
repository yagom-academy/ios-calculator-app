//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Lingo on 2022/03/18.
//

enum ExpressionParser {
  static func parse(from input: String) -> Formula {
    var formula = Formula()
    let inputString = self.componentsByOperators(from: input)
    inputString.forEach {
      if let number = Double($0) {
        formula.operands.enqueue(number)
      } else if let operation = Operator(rawValue: Character($0)) {
        formula.operators.enqueue(operation)
      }
    }
    return formula
  }
  
  private static func componentsByOperators(from input: String) -> [String] {
    return input
      .split(with: " ")
      .filter { $0.isEmpty == false }
  }
}
