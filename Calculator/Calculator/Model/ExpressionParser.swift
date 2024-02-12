//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Danny on 2/11/24.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        
        var operands = CalculatorItemQueue()
        var operators = CalculatorItemQueue()
        
        var componentByOperatorsArray = componentByOperators(from: input)
        
        operands.enqueue(componentByOperatorsArray[1])
        operators.enqueue(componentByOperatorsArray[0])
    
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
