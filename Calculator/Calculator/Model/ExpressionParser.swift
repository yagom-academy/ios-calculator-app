//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Danny on 2/20/24.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        
        let components = componentByOperators(from: input)
        
        for component in components {
            if let operandComponent = Double(component) {
                operands.push(operandComponent)
                continue
            }
            
            if let operatorComponent = Operator(rawValue: Character(component)) {
                operators.push(operatorComponent)
            }
        }
        
        let result = Formula(operands: operands, operators: operators)
        return result
    }

    private static func componentByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
