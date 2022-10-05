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
            var progressSplit: [String] = []
            
            components.forEach { string in
                progressSplit += string.split(with: operant.rawValue)
            }
            
            components = progressSplit
        }
        
        components = adjustMinusNumber(in: components)
        return components
    }
    
    private static func adjustMinusNumber(in components: [String]) -> [String] {
        var result: [String] = []
        
        var preCharacter = components[0]
        var index = 1
        
        if Double(preCharacter) == nil {
            preCharacter += components[1]
            index = 2
        }
        
        while index < components.count {
            var currentCharacter = components[index]
            
            if Double(preCharacter) == nil && Double(currentCharacter) == nil {
                currentCharacter += components[index + 1]
                index += 1
            }
            
            result.append(preCharacter)
            preCharacter = currentCharacter
            index += 1
        }
        
        result.append(preCharacter)
        return result
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
