//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 김진태 on 2021/11/14.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let components = componentsByOperators(from: input)
        let allOperatorSymbols = Operator.allCases.map { String($0.rawValue) }
        
        let operatorComponents = components.filter { allOperatorSymbols.contains($0) }.map { Character($0) }
        let operandComponents = components.filter { !allOperatorSymbols.contains($0) }
        var formula = Formula()
        
        operatorComponents.forEach { operatorComponent in
            guard let enumOperator = Operator(rawValue: operatorComponent) else { return }
            formula.operators.insert(enumOperator)
        }
        
        operandComponents.forEach { operandComponent in
            guard let doubleOperand = Double(operandComponent) else { return }
            formula.operands.insert(doubleOperand)
        }
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let allOperatorSymbols = Operator.allCases.map { $0.rawValue }
        
        let inputWithoutWhitespace = input.components(separatedBy: .whitespacesAndNewlines).joined()
        
        let components = allOperatorSymbols.reduce([inputWithoutWhitespace]) {
            (result: [String], operatorSymbol: Character) in
            return result
                .flatMap { component -> [String] in
                    return component.split(with: operatorSymbol)
                }
        }
        
        return components
    }
}
