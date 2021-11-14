//
//  ExpressionParser.swift
//  Calculator
//
//  Created by JeongTaek Han on 2021/11/14.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operands = CalculatorItemQueue<Double>()
        let operators = CalculatorItemQueue<Operator>()
        
        let splittedInput = componentsByOperators(from: input)
        
        splittedInput
            .compactMap { Double($0) }
            .forEach {
                operands.enqueue($0)
            }
        
        splittedInput
            .compactMap { Operator(rawValue: $0) }
            .forEach {
                operators.enqueue($0)
            }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var operators = ""
        Operator.allCases.forEach {
            operators.append($0.rawValue)
        }
        return input.components(separatedBy: operators)
    }
}
