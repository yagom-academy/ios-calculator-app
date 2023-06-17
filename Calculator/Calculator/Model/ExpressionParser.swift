//
//  ExpressionParser.swift
//  Calculator
//
//  Created by kyungmin, EtialMoon on 2023/06/07.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        
        componentsByOperators(from: input).compactMap { Double($0) }.forEach { operands.enqueue($0) }

        input.compactMap { Operator(rawValue: $0) }.forEach { operators.enqueue($0) }
                    
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return Operator.allCases.reduce([input], { resultArray, operators in
            resultArray.map { $0.split(with: operators.rawValue) }.flatMap { $0 }
        })
    }
}
