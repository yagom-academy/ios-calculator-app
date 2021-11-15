//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Ari on 2021/11/12.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operands = makeOperands(from: input)
        let operators = makeOperators(from: input)
        return Formula(opreands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let sliceInputValue = input.split()
        let operands = sliceInputValue.filter { Double($0.description) != nil }
        return operands
    }
    
    private static func makeOperators(from input: String) -> CalculatorItemQueue<Operator> {
        CalculatorItemQueue(input.split()
                                .filter{ $0.count == 1 }
                                .compactMap{ Operator(rawValue: Character($0)) })
    }
    
    private static func makeOperands(from input: String) -> CalculatorItemQueue<Double> {
        CalculatorItemQueue(componentsByOperators(from: input).compactMap{ Double($0) })
    }
}
