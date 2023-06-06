//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Serena on 2023/06/05.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        return Formula(operands: CalculatorItemQueue(queue: [0.0]), operators: CalculatorItemQueue(queue: [""]))
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let componentStandard = CharacterSet(charactersIn: String(Operator.allCases.map({$0.rawValue})))
        let componentParts: [String] = input.components(separatedBy: componentStandard)

        return componentParts
    }
}
