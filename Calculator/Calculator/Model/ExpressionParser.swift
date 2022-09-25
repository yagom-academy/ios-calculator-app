//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이경민 on 2022/09/25.
//


enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operators: [Operator] = Array(input.compactMap { Operator(rawValue: $0) })
        let operands: [Double] = componenetsByOperators(from: input).compactMap { Double($0) }
        
        return Formula(operands: operands, operators: operators)
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
