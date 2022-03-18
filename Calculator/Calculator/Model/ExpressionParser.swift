//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Red on 2022/03/18.
//

import Foundation

enum ExpressionParser {
    
    static func parse(form input: String) -> Formula {
        var fomula = Formula()
        let values = componentsByOperators(from: input)
        
        values.enumerated()
            .filter { $0.offset % 2 == 0 }
            .compactMap { Double($0.element) ?? .nan }
            .forEach { fomula.operands.enqueue(with: $0) }
        
        values.enumerated()
            .filter { $0.offset % 2 != 0 }
            .compactMap { Operator(rawValue: Character($0.element)) }
            .forEach { fomula.operators.enqueue(with: $0) }
        
        return fomula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
    
}
