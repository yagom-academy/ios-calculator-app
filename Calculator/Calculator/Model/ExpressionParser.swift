//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Seul Mac on 2021/11/14.
//

import Foundation

enum ExpressionParser {
    
    static func componentsByOperators(from input: String) -> [String] {
        var result = [input]
        for target in Operator.allCases {
            result = componentsByOneOperator(from: result, with: target.rawValue)
        }
        return result
    }
    
    private static func componentsByOneOperator(from input: [String], with target: Character) -> [String] {
        var result: [String] = []
        for formula in input {
            result += formula.split(with: target)
        }
        return result
    }
    
}
