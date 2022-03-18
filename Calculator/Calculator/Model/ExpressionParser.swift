//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Red on 2022/03/18.
//

import Foundation

enum ExpressionParser {
    
    static func parse(form input: String) -> Formula {
        var fomula = Formula()
        let values = componentsByOperators(from: input)

        let a: [Double] = values.enumerated()
                                .filter { $0.offset % 2 == 0 }
                                .compactMap { Double($0.element) ?? .nan }

        let b: [Operator] = values.enumerated()
                                    .filter { $0.offset % 2 != 0 }
                                    .compactMap { Operator(rawValue: Character($0.element)) }
   
        fomula.operands = CalculatorItemQueue(values: a)
        fomula.operators = CalculatorItemQueue(values: b)
        return fomula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
    
}
