//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Red on 2022/03/18.
//

import Foundation

enum ExpressionParser {
    static func parse(form input: String) -> Formula {
        let values = componentsByOperators(from: input)
        
        let operandsValue: [Double] = values.enumerated()
                                            .filter { $0.offset % 2 == 0 }
                                            .compactMap { Double($0.element) }
        
        let operatorValue: [Operator] = values.enumerated()
                                              .filter { $0.offset % 2 != 0 }
                                              .compactMap { Operator(rawValue: Character($0.element)) }
        
        return Formula(operands: CalculatorItemQueue(values: operandsValue), operators: CalculatorItemQueue(values: operatorValue))
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let rawInput = input.split(with: " ")
        var typeIndex: [String] = []
        var newInput: [String] = []
        
        for value in rawInput {
            Double(value) == nil ? typeIndex.append("operator") : typeIndex.append("number")
        }
        
        typeIndex.append("operator")
        
        for index in (0..<typeIndex.count - 1) where typeIndex[index] != typeIndex[index + 1] {
            newInput.append("\(rawInput[index])")
        }
        
        return newInput
    }
}
