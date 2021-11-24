//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 예거 on 2021/11/16.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let convertedOperand = input.split(with: " ")
                                    .compactMap { operand in Double(operand) }
        let convertedOperator = componentsByOperators(from: input)
                                .compactMap { `operator` in Operator(symbol: `operator`) }
        
        return Formula(operands: CalculatorItemQueue(queue: convertedOperand),
                       operators: CalculatorItemQueue(queue: convertedOperator))
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
                    .filter { eachString in Operator.contains(eachString) }
    }
}
