//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Eunsoo KIM on 2021/11/12.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let formula = Formula()
        
        _ = componentsByOperators(from: input).compactMap { Double($0) }
                                              .map { formula.operands.enqueue($0) }
        
        _ = componentsByOperators(from: input).compactMap { Operator(rawValue: Character($0)) }
                                              .map { formula.operators.enqueue($0) }
        
        return formula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        input.split(with: " ")
    }
}
