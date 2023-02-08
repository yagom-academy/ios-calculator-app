//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 혜모리, 릴라 on 2023/01/27.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operatorValues = Operator.allCases.map { String($0.rawValue) }
        let operands = componentsByOperators(from: input)
        let operators = input.split(with: " ").filter { operatorValues.contains($0) }
        let formula = Formula()
        
        operands
            .compactMap { Double($0) }
            .forEach { formula.operands.enqueue($0) }
        operators
            .compactMap { Operator.init(rawValue: Character($0)) }
            .forEach { formula.operators.enqueue($0) }
        return formula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let operatorValues = Operator.allCases.map { String($0.rawValue) }
        var inputs: [String] = []
        let result: [String]
        let delimiter: Character = " "
        
        inputs = input.split(with: delimiter)
        result = inputs.filter { operatorValues.contains($0) == false }
        return result
    }
}
