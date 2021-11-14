//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 양호준 on 2021/11/14.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        let operandsItems = componentsByOperators(from: input).compactMap { Double($0) }
        let operatorsItems = input.compactMap { Operator(rawValue: $0) }
        
        formula.operands.items = operandsItems
        formula.operators.items = operatorsItems
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
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


