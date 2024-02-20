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
            }
        }
        
        input.forEach { char in
            if let operatorValue = Operator(rawValue: char) {
                operators.enqueue(operatorValue)
            }
        }

        return Formula(operands: operands, operators: operators)
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        let arrayComponents = input.map { Operator(rawValue: $0) != nil ? " " : String($0) }.joined()
        return arrayComponents.split(with: " ")
    }
}

