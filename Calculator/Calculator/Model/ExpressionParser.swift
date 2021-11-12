//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Eunsoo KIM on 2021/11/12.
//

import Foundation

enum ExpressionParser {
    
    static private func componentsByOperators(from input: String) -> [String] {
        input.split(with: " ")
    }
}
