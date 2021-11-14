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
        
        for each in splittedInput {
            if let convertedNumber = Double(each) {
                operands.enqueue(convertedNumber)
            } else {
                operators.enqueue(each)
            }
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        input.split(with: " ")
    }
}
