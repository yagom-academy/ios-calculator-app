//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 양호준 on 2021/11/14.
//

enum ExpressionParser {
    
    
    func componentsByOperators(from input: String) -> [String] {
        let operators = Operator.allCases.map { $0.rawValue }
        var operands: [String] = []
        
        for `operator` in operators {
            operands = input.split(with: `operator`)
        }
        
        return operands
    }
}
