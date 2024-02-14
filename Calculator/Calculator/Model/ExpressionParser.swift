//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Danny on 2/11/24.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        
        let componentByOperatorsArray = componentByOperators(from: input)
        
        if let DoubleValueOfOperands = Double(componentByOperatorsArray[1]) {
            operands.enqueue(DoubleValueOfOperands)
        }
        
        if let OperatorValueOfOperator = Operator(rawValue: Character(componentByOperatorsArray[0])) {
            operators.enqueue(OperatorValueOfOperator)
        }
    
        let resultOfParse = Formula(operands: operands, operators: operators)
        
        return resultOfParse
        
    }
    
    private static func componentByOperators(from input: String) -> [String] {
        
        if input.split(with: "+").count > 1 {
            return input.split(with: "+")
        } else if input.split(with: "-").count > 1 {
            return input.split(with: "-")
        } else if input.split(with: "*").count > 1 {
            return input.split(with: "*")
        } else {
            return input.split(with: "/")
        }
        
    }
}
