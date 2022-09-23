//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 써니쿠키 on 2022/09/22.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) throws -> Formula {
        var formula = Formula()
        let operands = componentsByOperators(from: input)
        let operators = input.map { $0 }.compactMap { Operator.init(rawValue: $0) }
        
        operands.compactMap { Double($0) }.forEach { formula.operands.enqueue($0) }
        operators.forEach { formula.operators.enqueue($0) }
    
        return formula
    }

    static func componentsByOperators(from input: String) -> [String] {
        let operators = CharacterSet(charactersIn: Operator.allCases.map { String($0.rawValue) }.joined())
        return input.components(separatedBy: operators)
    }
}
