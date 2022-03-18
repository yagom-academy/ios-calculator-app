//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Red on 2022/03/18.
//

import Foundation

enum ExpressionParser {
    
    static func parse(form input: String) -> Formula {
        var formula = Formula()
        let values = componentsByOperators(from: input)

        let operandsValue: [Double] = values.enumerated()
                                .filter { $0.offset % 2 == 0 }
                                .compactMap { Double($0.element) }

        let operatorValue: [Operator] = values.enumerated()
                                    .filter { $0.offset % 2 != 0 }
                                    .compactMap { Operator(rawValue: Character($0.element)) }
   
        formula.operands = CalculatorItemQueue(values: operandsValue)
        formula.operators = CalculatorItemQueue(values: operatorValue)
        return formula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
    
}
