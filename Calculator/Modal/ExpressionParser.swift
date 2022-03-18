//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 우롱차 on 2022/03/18.
//

import Foundation

protocol CalculateItem {
}

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        
        let splitStringArray = componentsByOperators(from: input)
        let operands = CalculatorItemQueue<String>()
        let operators = CalculatorItemQueue<Operator>()
        
        for item in splitStringArray {
            if let operatorItem = Operator(rawValue: Character(item)) {
                operators.enqueue(operatorItem)
            } else {
                operands.enqueue(item)
            }
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
