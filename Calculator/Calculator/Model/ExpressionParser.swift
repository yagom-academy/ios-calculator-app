//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Minsup on 2023/05/31.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        return Formula(
            operands: CalculatorItemQueue<Double>(),
            operators: CalculatorItemQueue<Operator>()
        )
    }
    
    private func componentsByOperators(from input: String) -> [String] {      
        return []
    }
}
