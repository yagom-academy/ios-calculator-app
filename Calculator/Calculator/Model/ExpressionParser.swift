//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/12.
//

import Foundation

enum ExpressionParser { }

// MARK: - internal static method

extension ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue()
        var operators = CalculatorItemQueue()
        
        componentByOperators(from: input)
            .compactMap{ Double($0) }
            .forEach { operands.enqueue(number: $0) }
        
        componentByOperators(from: input)
            .compactMap{ $0.first }
            .compactMap{ Operator(rawValue: $0)}
            .forEach { operators.enqueue(operatorItem: $0) }
        
        return Formula(operands: operands, operators: operators)
    }
}

// MARK: - private static method

extension ExpressionParser {
    private static func componentByOperators(from input: String) -> [String] {
        return Operator.allCases
            .reduce([input]) { (result, `operator`) in result.flatMap { $0.split(with: `operator`.rawValue)} }
    }
}
