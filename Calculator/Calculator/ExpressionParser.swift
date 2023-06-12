//
//  ExpressionParser.swift
//  Calculator
//
//  Created by redmango1446 on 2023/06/06.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        let inputStrings = componentsByOperators(from: input)
        
        inputStrings
            .compactMap { Double($0) }
            .forEach { formula.operands.enqueue($0) }
        
        input
            .compactMap { Operator(rawValue: $0) }
            .forEach { formula.operators.enqueue($0) }

        return formula
    }

    private static func componentsByOperators(from input: String) -> [String] {
        let operators = String(Operator.allCases.map{ $0.rawValue })
        let operatorCharacterSet = CharacterSet(charactersIn: operators)

        return input.components(separatedBy: operatorCharacterSet)
    }
}
