//
//  ExpressionParser.swift
//  Calculator
//
//  Created by redmango1446 on 2023/06/06.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        let inputStrings = componentsByOperators(from: input)
        
        inputStrings
            .compactMap { Double($0) }
            .forEach { formula.operands.enqueue($0) }
        
        inputStrings
            .filter { Double($0) == nil }
            .compactMap { Operator(rawValue: Character($0)) }
            .forEach { formula.operators.enqueue($0) }
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
