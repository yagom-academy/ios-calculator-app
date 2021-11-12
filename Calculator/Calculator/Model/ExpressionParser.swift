//
//   ExpressionParser.swift
//  Calculator
//
//  Created by 임지성 on 2021/11/11.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        return Formula(operators: CalculatorItemQueue(), operands: CalculatorItemQueue())
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return [""]
    }
}
