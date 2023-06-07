//
//  ExpressionParser.swift
//  Calculator
//
//  Created by kangkyungmin on 2023/06/07.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        
        componentsByOperators(from: input).compactMap { Double($0) }.forEach { element in operands.enqueue(element) }

        input.compactMap { Operator(rawValue: $0) }.forEach { element in operators.enqueue(element) }
                    
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return Operator.allCases.reduce([input], { resultArray, operators in
            resultArray.map { $0.split(with: operators.rawValue) }.flatMap { $0 }
        })
    }
}
