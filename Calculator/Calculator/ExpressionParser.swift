//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이원빈 on 2022/05/19.
//

import Foundation

enum ExpressionParser {
    
    static func parse(from input: String) -> Formula {
        let operandsList = componentsByOperators(from: input).map{ Double($0) ?? 0 }
        let operatorsList = input.split(with: " ").filter{ Double($0) == nil }.map{ Character($0) }
        return Formula(operands: CalculatorItemQueue(stack: operandsList),
                       operators: CalculatorItemQueue(stack: operatorsList))
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let splitedInput = input.split(with: " ")
        let onlyOperands = splitedInput.filter{ Double($0) != nil }
        return onlyOperands
    }
}
