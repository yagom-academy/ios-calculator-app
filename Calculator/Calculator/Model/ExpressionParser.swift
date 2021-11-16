//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Sunwoo on 2021/11/16.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        componentsByOperators(from: input)
        return Formula()
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        return [String]()
    }
}
