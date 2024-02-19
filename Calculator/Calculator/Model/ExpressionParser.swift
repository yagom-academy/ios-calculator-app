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
            } else if let firstCharacter = component.first, let operatorValue = Operator(rawValue: firstCharacter) {
                operators.enqueue(operatorValue)
            }
        }

        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operatorsSet = CharacterSet(charactersIn: "+-*/")
        return input.components(separatedBy: operatorsSet).filter { !$0.isEmpty }
    }
}

