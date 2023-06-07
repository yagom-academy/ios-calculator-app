//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Whales on 2023/06/07.
//

import Foundation

enum ExpressionParser {
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
