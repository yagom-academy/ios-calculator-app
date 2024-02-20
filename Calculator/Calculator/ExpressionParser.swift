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
        
        for i in 0...componentByOperatorsArray.count - 1 {
            if i % 2 == 0 {
                if let DoubleValueOfOperands = Double(componentByOperatorsArray[i]) {
                    operands.enqueue(DoubleValueOfOperands)
                }
            } else {
                if let OperatorValueOfOperator = Operator(rawValue: Character(componentByOperatorsArray[i])) {
                    operators.enqueue(OperatorValueOfOperator)
                }
            }
        }
        
        let resultOfParse = Formula(operands: operands, operators: operators)
        
        return resultOfParse
        
    }

    private static func componentByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}

