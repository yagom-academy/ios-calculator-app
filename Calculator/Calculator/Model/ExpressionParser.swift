//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이승재 on 2021/11/10.
//

import Foundation

enum ExpressionParser {
    func parase(from input: String) -> Formula {
        return Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }
    
    private func componentsByOperators(from input: String) -> [String] {
        return []
    }
}
