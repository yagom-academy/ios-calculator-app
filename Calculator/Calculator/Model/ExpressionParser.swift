//
//  ExpressionParser.swift
//  Calculator
//
//  Created by kaki on 2023/01/27.
//

enum ExpressionParser {
     static func parse(from input: String) -> Formula {
         var operands = CalculatorItemQueue<Double>()
         var operators = CalculatorItemQueue<Operator>()
         let components = componentsByOperators(from: input)
         
         components.forEach { component in
             if let operand = Double(component) {
                 operands.enqueue(operand)
             } else if let `operator` = Operator(rawValue: Character(component)) {
                 operators.enqueue(`operator`)
             }
         }
         
         return Formula(operands: operands, operaters: operators)
     }

    private static func componentsByOperators(from input: String) -> [String] {
        input.split(with: " ")
    }
}
