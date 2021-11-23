//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 고은 on 2021/11/22.
//

import Foundation

enum ExpressionParser {
    private static func componentsByOperators(from input: String) -> [String] {
        var result: [String] = [input]
        Operator.allCases.forEach { targetOperator in
            var splitedString: [String] = []
            for input in result {
                splitedString += input.split(with: targetOperator.rawValue)
                result = splitedString
            }
        }
        return result
    }
}
