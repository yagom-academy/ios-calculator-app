//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 황제하 on 2021/11/12.
//

import Foundation

enum ExpressionParser {
    static func parse(form input: String) -> Formula {
        let formula = Formula()
        
        let numbers = componentsByOperators(form: input).compactMap { Double($0) }
        
        numbers.forEach { formula.operands.enqueue(value: $0) }
        
        let operators = input.filter { Double($0.description) == nil }.compactMap { Operator.init(rawValue: $0) }
        
        operators.forEach { formula.operators.enqueue(value: $0) }
        
        return formula
    }
    
    static func componentsByOperators(form input: String) -> [String] {
        var result = input
        
        Operator.allCases.forEach { `operator` in
            result = result.replacingOccurrences(of: `operator`.rawValue.description, with: " ")
        }
        
        return result.split(with: " ")
    }
}
