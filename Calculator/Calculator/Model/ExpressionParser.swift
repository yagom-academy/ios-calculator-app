//
//  ExpressionParser.swift
//  Calculator
//
//  Created by SeoDongyeon on 2022/03/28.
//

import Foundation

enum ExpressionParser {
    private func componentsByOperators(input: String) -> [String] {
        return input.split(with: " ")
    }
}
