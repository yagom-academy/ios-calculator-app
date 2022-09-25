//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이경민 on 2022/09/25.
//


enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let input = input.components(separatedBy: ["^", "!", "@", "#", "$", "%", "&"]).joined()
        let operators: [Operator] = Array(input.compactMap { Operator(rawValue: $0) })
        print(componenetsByOperators(from: input))
        let operands: [Double] = componenetsByOperators(from: input).compactMap { Double($0) }
        
        return Formula(operands: operands, operators: operators)
    }
    
    static private func componenetsByOperators(from input: String) -> [String] {
        let operators = Operator.allCases.map { $0.rawValue }
        var result: String = input
        
        operators.forEach { result = result.split(with: $0).joined() }
        print(result)
        return result.split(separator: " ").map { $0.description }
    }
}
