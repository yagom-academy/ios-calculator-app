//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 예거 on 2021/11/16.
//

import Foundation

enum ExpressionParser {
    
    static func parse(from input: String) -> Formula {
        let whiteSpace: Character = " "
        let splitedInput = input.split(with: whiteSpace)
        let rawValueOperators = componentsByOperators(from: input)
        let operands = CalculatorItemQueue(queue: splitedInput.compactMap { Double($0) })
        let operators = CalculatorItemQueue(queue: rawValueOperators.compactMap { Operator(rawValue: Character($0)) })
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operatorRawValues = Operator.allCases.map { $0.rawValue.description }
        let whiteSpace: Character = " "
        let splitedInput = input.split(with: whiteSpace)
        
        return splitedInput.filter { operatorRawValues.contains($0) }
    }
}
