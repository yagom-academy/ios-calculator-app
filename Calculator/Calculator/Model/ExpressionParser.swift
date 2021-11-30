//
//  ExpressionParser.swift
//  Calculator
//
//  Created by yeha on 2021/11/15.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let convertedOperand = input.split(with: Character.whiteSpace)
                                    .compactMap { operand in Double(operand) }
        let convertedOperator = componentsByOperators(from: input)
                                .compactMap { `operator` in Operator(symbol: `operator`) }
        let operands = CalculatorItemQueue(convertedOperand)
        let operators = CalculatorItemQueue(convertedOperator)
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: Character.whiteSpace)
                    .filter { eachString in Operator.doesContain(eachString) }
    }
}
