//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Minsup on 2023/05/31.
//

enum ExpressionParser {    
    static func parse(from input: String) throws -> Formula {
        let validOperators = Operator.allCases.map { $0.rawValue }
        
        let operands = componentsByOperators(from: input)
            .compactMap { Double($0)}
        let operators = input
            .compactMap { Operator(rawValue: $0) }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operators = Operator.allCases.map { $0.rawValue }
        
        return [input.filter {!operators.contains($0)}]
    }
}
