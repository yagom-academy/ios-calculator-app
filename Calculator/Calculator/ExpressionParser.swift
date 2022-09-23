//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 정선아 on 2022/09/23.
//

import Foundation

enum ExpressionParser {
    private static func componentsByOperators(from input: String) -> [String] {
        var arithmeticExpressionArray = [input]
        var tempArray: [String] = []
        
        Operator.allCases.forEach { oneOfOperator in
            let character = oneOfOperator.rawValue
            for arithmeticExpression in arithmeticExpressionArray {
                tempArray += arithmeticExpression.split(with: character)
                arithmeticExpressionArray = tempArray
                tempArray.removeAll()
            }
        }
        return arithmeticExpressionArray
    }
}
