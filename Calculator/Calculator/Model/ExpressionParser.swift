//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이경민 on 2022/09/25.
//


enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        return Formula()
    }
    
    static func componenetsByOperators(from input: String) -> [String] {
        let operators = Operator.allCases.map { $0.rawValue }
        var input = input
        var result: [String] = []
        
        operators.forEach { opt in
            input = input.filter { $0 != opt }
            result = input.split(with: opt)
        }
        
        return result
    }
}
