//
//  ExpressionParser.swift
//  Calculator
//
//  Created by idinaloq on 2023/06/02.
//

import Foundation

enum Expressionparser {
    static func parse(from input: String) -> Formula {
        let components: [String] = componentsByOperators(from: input)
        var formula: Formula = Formula()
        
        components.forEach { component in
            if let operandElement = Double(component) {
                formula.operands.enqueue(operandElement)
            }
            
            if let operatorElement = Operator(rawValue: Character(component)) {
                formula.operators.enqueue(operatorElement)
            }
        }
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var result: [String] = [input]
        
        Operator.allCases.forEach { operatorCase in
            result = result.flatMap { $0.components(separatedBy: String(operatorCase.rawValue)) }
        }
        
        return result
    }
}
