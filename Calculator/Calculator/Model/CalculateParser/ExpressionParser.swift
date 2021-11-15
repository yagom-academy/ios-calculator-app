//
//  ExpressionParser.swift
//  Calculator
//
//  Created by JeongTaek Han on 2021/11/14.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) throws -> Formula {
        let operands = CalculatorItemQueue<Double>()
        let operators = CalculatorItemQueue<Operator>()
        
        let splittedInput = componentsByOperators(from: input)
        
        splittedInput
            .compactMap { Double($0) }
            .forEach {
                operands.enqueue($0)
            }
        
        try splittedInput
            .filter { Double($0) == nil }
            .map {
                guard let newOperator = Operator(rawValue: Character($0)) else {
                    throw CalculatorError.unknownOperator
                }
                return newOperator
            }
            .forEach {
                operators.enqueue($0)
            }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        input.split(with: " ")
    }
}

