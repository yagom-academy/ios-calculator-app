//
//  ExpressionParser.swift
//  Calculator
//
//  Created by karen, Mary.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula(operands: CalculatorItemQueue(), operators: CalculatorItemQueue())

        componentsByOperators(from: input).compactMap { Double($0) }.forEach { formula.operands.enqueue($0) }
        input.compactMap { Operator(rawValue: $0) }.forEach { formula.operators.enqueue($0) }
        
        return formula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let operators = Operator.allCases
                                .map { String($0.rawValue) }
                                .joined()
        return input.components(separatedBy: CharacterSet(charactersIn: operators))
    }
}

