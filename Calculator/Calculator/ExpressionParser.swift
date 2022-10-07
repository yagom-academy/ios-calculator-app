//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Mangdi on 2022/09/22.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let components = componentsByOperators(from: input)
        let operands = CalculatorItemQueue<Double>()
        let operators = CalculatorItemQueue<Operator>()
        var formula = Formula(operands: operands, operators: operators)
        
        for item in components {
            if let doubleNumber = Double(item) {
                formula.operands?.enqueue(doubleNumber)
            } else {
                if let a = Operator.init(rawValue: Character(item)) {
                    formula.operators?.enqueue(a)
                }
            }
        }
        return formula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
