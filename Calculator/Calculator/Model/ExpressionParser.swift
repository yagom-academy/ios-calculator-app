//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 박우연 on 2021/11/16.
//

import Foundation

enum ExpressionParser {
    static func componentsByOperators(from input: String) -> [String] {
        var result: [String] = [input]
        Operator.allCases.forEach { `operator` in
            var splitedString: [String] = []
            for input in result {
                splitedString += input.split(with: `operator`.rawValue)
                result = splitedString
            }
        }
        return result
    }
}
