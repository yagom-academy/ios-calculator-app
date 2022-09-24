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
        let foundedMinusNumberComponents = adjustMinusNumber(in: components)
        
        foundedMinusNumberComponents.forEach { string in
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
        
        return components
    }
    
    private static func adjustMinusNumber(in components: [String]) -> [String] {
        var result: [String] = []
        
        var preCharacter = components[0]
        var index = 1
        
        // 첫번째 값이 연산자면
        if Int(preCharacter) == nil {
            preCharacter += components[1]
            index = 2
        }
        
        while index < components.count {
            var currentCharacter = components[index]
            
            // 연산자, 연산자 일때
            if Int(preCharacter) == nil && Int(currentCharacter) == nil {
                currentCharacter += components[index + 1]
                index += 1
            }
            
            result.append(preCharacter)
            preCharacter = currentCharacter
            index += 1
            
            print(result)
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
