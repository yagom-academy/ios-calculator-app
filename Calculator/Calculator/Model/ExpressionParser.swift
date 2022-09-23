//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이정민 on 2022/09/23.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        let components = self.componentsByOperators(from: input)
        
        components.forEach { string in
            enqueue(string, in: &formula)
        }
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var components: [String] = [input]
        
        Operator.allCases.forEach { operant in
            let progressSplit = components
            components = []
            
            progressSplit.forEach { string in
                components += string.split(with: operant.rawValue)
            }
        }
        
        return components
    }
    
    private static func enqueue(_ component: String, in formula: inout Formula) {
        if let number = Double(component) {
            formula.operands.enqueue(number)
        } else {
            if let operant = Operator(rawValue: Character(component)) {
                formula.operators.enqueue(operant)
            }
        }
    }
}
