//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이승재 on 2021/11/10.
//

import Foundation

enum ExpressionParser {
    
    static func parse(from input: String) -> Formula {
        let operandsItems = CalculatorItemQueue(enqueueStack: componentsByOperators(from: input).compactMap { Double($0) })
        let operatorsItems = CalculatorItemQueue(enqueueStack: input.compactMap { Operator(rawValue: $0) })
        let formula = Formula(operands: operandsItems, operators: operatorsItems)
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.replacingOccurrences(of: ",", with: "")
            .split(with: " ")
            .compactMap { Double($0) }
            .map { String($0) }
    }
}
