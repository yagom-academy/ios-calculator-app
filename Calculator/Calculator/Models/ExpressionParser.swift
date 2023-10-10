//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Toy on 10/9/23.
//


enum ExpressionParser {
   static func parse(from input: String) -> Formula {
        let cal = CalculatorItemQueue<Double>()
        return Formula(operands: cal, operators: cal)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        return [""]
    }
}
