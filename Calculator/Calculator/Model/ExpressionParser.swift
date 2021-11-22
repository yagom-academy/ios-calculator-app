//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Seul Mac on 2021/11/14.
//

import Foundation

enum ExpressionParser {
    
    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        let operandsArray = componentsByOperators(from: input).compactMap { Double($0) }
        let operatorsArray = input.compactMap { Operator(sign: $0) }
        
        operandsArray.forEach { operands.enqueue($0) }
        operatorsArray.forEach { operators.enqueue($0) }
        
        return Formula(operands: operands, operators: operators)
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        var result = [input]
        for target in Operator.allCases {
            result = componentsByOneOperator(from: result, with: target.operatorSign)
        }
        return result
    }
    
    private static func componentsByOneOperator(from input: [String], with target: Character) -> [String] {
        var result: [String] = []
        for formula in input {
            result += formula.split(with: target)
        }
        return result
    }
    
}
