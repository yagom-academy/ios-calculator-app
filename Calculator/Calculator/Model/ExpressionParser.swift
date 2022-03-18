//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 조민호 on 2022/03/18.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        
        Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }
    
    private func componentsByOperators(from input: String) -> [String] {
        return []
    }
}
