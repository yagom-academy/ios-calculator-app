//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Ari on 2021/11/12.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operands = componentsByOperators(from: input)
                        .compactMap{ Double($0) }
        let operators = input.map{ $0 }
                        .compactMap{ Operator(rawValue: $0) }
        return Formula(opreands: CalculatorItemQueue(operands),
                       operators: CalculatorItemQueue(operators))
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operatros = Operator.allCases.map{ $0.rawValue }
        var convertValue = ""
        input.forEach{ element in
            let isOperator = operatros.contains(element)
            if isOperator {
                convertValue = input.replacingOccurrences(of: element.description, with: " \(element) ")
            }
        }
        let sliceInputValue = convertValue.split()
        let operands = sliceInputValue.filter { Double($0.description) != nil }
        return operands
    }
}
