//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 조민호 on 2022/03/18.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        input.split(with: " ")
            .compactMap { string in
                Double(string)
            }
            .map { double in
                String(double)
            }
    }
}
