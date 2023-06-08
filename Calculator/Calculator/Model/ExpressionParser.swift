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
        
        componentsByOperators(from: input)
            .compactMap { Double($0) }
            .forEach { formula.operands.enqueue($0) }
    
        input
            .filter { $0.isNumber == false }
            .compactMap { Operator(rawValue: $0) }
            .forEach { formula.operators.enqueue($0) }
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operands = Operator.allCases.reduce([input]) { accumulatedArray, operatorItem in
            accumulatedArray
                .map { $0.split(with: operatorItem.rawValue) }
                .flatMap { $0 }
        }

        return operands
    }
}
