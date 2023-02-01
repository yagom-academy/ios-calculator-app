//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Seoyeon Hong on 2023/01/31.
//

enum ExpressionParser {
    
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        let result = componentsByOperators(from: input)
        
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
        return input.split(with: " ")
    }
}

extension String {
    func split(with target: Character) -> [String] {
        return components(separatedBy: String(target))
    }
    
}
