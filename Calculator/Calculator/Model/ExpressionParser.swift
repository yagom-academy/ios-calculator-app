//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 양호준 on 2021/11/14.
//

enum ExpressionParser {
    
    static func componentsByOperators(from input: String) -> [String] {
        let operators = Operator.allCases.map { $0.rawValue }
        var operands: [String] = []
        var convertInput = input
        
        for operatorElement in operators {
            convertInput = convertInput.replacingOccurrences(of: String(operatorElement), with: " ")
            operands = convertInput.split(with: " ")
        }
        
        return operands
    }
}


