//
//  ExpressionParser.swift
//  Calculator
//
//  Created by redmango1446 on 2023/06/06.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        let inputStrings = componentsByOperators(from: input)
        
        inputStrings.compactMap{ Double($0) }.forEach{ formula.operands.enqueue($0) }
        input.compactMap{ Operator(rawValue: $0) }.forEach{ formula.operatos.enqueue($0) }
        
        return formula
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
