//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이경민 on 2022/09/25.
//


enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let removedSpecial = input.components(separatedBy: ["^", "!", "@", "#", "$", "%", "&"]).joined()
        let removedPlain = removedSpecial.filter { Double(String($0)) != nil || Operator(rawValue: $0) != nil }
        
        let operators: [Operator] = Array(removedPlain.compactMap { Operator(rawValue: $0) })
        let operands: [Double] = componenetsByOperators(from: removedPlain).compactMap { Double($0) }
        
        return Formula(operands: operands, operators: operators)
    }
    
    static private func componenetsByOperators(from input: String) -> [String] {
        let operators = Operator.allCases.map { $0.rawValue }
        var result: String = input
        
        operators.forEach { result = result.split(with: $0).joined() }

        return result.split(separator: " ").map { $0.description }
    }
}
