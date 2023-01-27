//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Jinah Park on 2023/01/27.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operands: CalculatorItemQueue<Double> = .init()
        let operators: CalculatorItemQueue<Operator> = .init()
        let components = Formula(operands: operands, operators: operators)
        return components
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return ["0"]
    }
}
