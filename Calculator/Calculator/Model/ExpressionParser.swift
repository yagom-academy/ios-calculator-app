//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 김진태 on 2021/11/14.
//

import Foundation

enum ExpressionParser {
    func parse(from input: String) -> Formula {
        let components = componentsByOperators(from: input)
        let operatorRawValues = Operator.allCases.map { String($0.rawValue) }
        
        let operatorComponents = components.filter { operatorRawValues.contains($0) }.map { Character($0) }
        let operandComponents = components.filter { !operatorRawValues.contains($0) }
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
    
    private func componentsByOperators(from input: String) -> [String] {
        let operatorRawValues = Operator.allCases.map{ $0.rawValue }
        
        let trimmedInput = input.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let components = operatorRawValues.reduce([trimmedInput]) {
            (result: [String], operatorRawValue: Character) in
            return result.flatMap { $0.split(with: operatorRawValue) }
        }
        return components
    }
}
