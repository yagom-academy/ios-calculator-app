//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이예은 on 2022/05/20.
//

import Foundation

enum ExpressionParser {
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}

