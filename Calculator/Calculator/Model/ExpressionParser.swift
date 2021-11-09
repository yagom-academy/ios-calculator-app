//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/09.
//

import Foundation

enum ExpressionParser {
    case a
    
    func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Character>()
        
        let inputString = componentsByOperators(from: input)
        
        for string in inputString {
            if let operandForQueue = Double(string) {
                operands.enQueue(operandForQueue)
            } else {
                operators.enQueue(Character(string))
            }
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private func componentsByOperators(from input: String) -> [String] {
        return input.components(separatedBy: " ")
    }
}
