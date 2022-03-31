//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 김태훈 on 2022/03/28.
//

import Foundation

enum ExpressionParser {
    static func parse(frome input: String) -> Formula {
        var formula = Formula()
        
        input.split(with: " ")
            .compactMap { Double($0) }
            .forEach { formula.operands.enqueue(value: $0) }
        
        componentsByOperators(from: input)
            .compactMap { Operator(rawValue: Character($0)) }
            .forEach { formula.operators.enqueue(value: $0) }
        
        return formula
    }
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ").filter {
            Double($0) == nil
        }
    }
}

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map {
            String($0)
        }
    }
}
