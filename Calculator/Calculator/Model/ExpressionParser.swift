//
//  ExpressionParser.swift
//  Calculator
//
//  Created by dhoney96 on 2022/05/20.
//

enum ExpressionParser {
    static func componentsByOperators(from input: String) -> [String] {
        var data = input
        let lastCharacter = data.removeLast()
        return input.split(with: lastCharacter)
    }
}
