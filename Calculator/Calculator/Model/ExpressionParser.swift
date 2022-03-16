//
//  ExpressionParser.swift
//  Calculator
//
//  Created by mmim.
//

import Foundation

enum ExpressionParser {
    private func componentsByOperator(from input: String) -> [String] {
        return input.components(separatedBy: ["+", "-", "/", "*"])
    }
}
