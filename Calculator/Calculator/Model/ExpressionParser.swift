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
        let inputSource = input.split(with: " ")
        var inputScourceType: [String] = []
        var clearInput: [String] = []
        
        for value in inputSource {
            Double(value) == nil ? inputScourceType.append("operator") : inputScourceType.append("number")
        }
        
        inputScourceType.append("operator")
        
        for index in (0..<inputScourceType.count - 1) where inputScourceType[index] != inputScourceType[index + 1] {
            clearInput.append("\(inputSource[index])")
        }
        
        return clearInput
    }
}
