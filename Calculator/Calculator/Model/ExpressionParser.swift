//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Dasan on 2023/06/02.
//

import Foundation

enum ExpressionParser {
    static func parser(from input: String) -> Formula {
        var formula = Formula(operands: CalculatorItemQueue(),
                              operators: CalculatorItemQueue())
        
        let operands = componentsByOperators(from: input).compactMap { Double($0) }
        
        operands.forEach {
            formula.operands.enqueue($0)
        }
    
        let operators = input.filter { $0.isNumber == false }
                             .compactMap { Operator(rawValue: $0) }
        
        operators.forEach {
            formula.operators.enqueue($0)
        }
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var operands: [String]
        
        operands = Operator.allCases.reduce([input]) { accumulatedArray, operatorItem in
            accumulatedArray.map { $0.split(with: operatorItem.rawValue) }
                            .flatMap { $0 }
        }

        return operands
    }
}
