//
//  ExpressionParser.swift
//  Calculator
//
//  Created by yeha on 2021/11/15.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let convertedOperand = input.split(with: " ")
                                    .compactMap { operand in Double(operand) }
        let convertedOperator = componentsByOperators(from: input)
                                .compactMap { `operator` in Operator(symbol: `operator`) }
        
        return Formula(operands: CalculatorItemQueue(convertedOperand),
                       operators: CalculatorItemQueue(convertedOperator))
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
                    .filter { eachString in Operator.doesContain(eachString) }
    }
}
