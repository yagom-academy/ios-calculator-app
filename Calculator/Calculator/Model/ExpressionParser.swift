//
//  ExpressionParser.swift
//  Calculator
//
//  Created by EUNJI CHOI on 2/16/24.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let components = componentsByOperators(from: input)
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        
        components.forEach { component in
            if let value = Double(component) {
                operands.enqueue(value)
            } else if let firstCharacter = component.first,
                      let operatorValue = Operator(rawValue: firstCharacter) {
                operators.enqueue(operatorValue)
            }
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        var components = [String]()
        var currentComponent = ""
        
        input.forEach { character in
            if let _ = Operator(rawValue: character) {
                if !currentComponent.isEmpty {
                    components.append(currentComponent)
                    currentComponent = ""
                }
                components.append(String(character))
            } else {
                currentComponent.append(character)
            }
        }
        if !currentComponent.isEmpty {
            components.append(currentComponent)
        }
        
        return components
    }
}

