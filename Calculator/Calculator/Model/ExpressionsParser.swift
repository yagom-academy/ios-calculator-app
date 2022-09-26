//  ExpressionsParser.swift
//  Created by zhilly on 2022/09/26.

enum ExpressionParser {
    func parse (from input: String) -> Formula {
        return Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }
    
    private func componentsByOperators(from input: String) -> [String] {
        return []
    }
}
