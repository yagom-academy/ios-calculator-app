//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Seoyeon Hong on 2023/01/31.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        let result = componentsByOperators(from: input)
        
        result.forEach {
            if let num = Double($0) {
                formula.operands.enqueue(num)
            } else if $0.isEmpty == false {
                let char = Character($0)
                Operator(rawValue: char).map { formula.operators.enqueue($0) }
            }
        }
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
