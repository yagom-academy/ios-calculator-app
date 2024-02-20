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
        
        let componentByOperatorsArray = componentByOperators(from: input)
        
        for component in componentByOperatorsArray {
            if let DoubleValueOfOperands = Double(component) {
                operands.push(DoubleValueOfOperands)
            }
            
            if let OperatorValueOfOperator = Operator(rawValue: Character(component)) {
                operators.push(OperatorValueOfOperator)
            }
        }
        
        let resultOfParse = Formula(operands: operands, operators: operators)
        return resultOfParse
    }

    private static func componentByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
