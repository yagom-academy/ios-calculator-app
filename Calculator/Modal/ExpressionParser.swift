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
        let operands = CalculatorItemQueue()
        let operators = CalculatorItemQueue()
        
        for item in splitStringArray {
            if let doubleItem = Double(item) {
                operands.enqueue(calculateItem: doubleItem)
            } else if let operatorItem = Operator(rawValue: Character(item)) {
                operators.enqueue(calculateItem: operatorItem)
            }
        }
    
        return Formula(operands: operands, operators: operators)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
            return input.split(with: " ")
    }
}
