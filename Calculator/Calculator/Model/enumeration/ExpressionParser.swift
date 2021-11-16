//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 예거 on 2021/11/16.
//

import Foundation

enum ExpressionParser {
    
    static func componentsByOperators(from input: String) -> [String] {
        let operatorRawValues = Operator.allCases.map { $0.rawValue.description }
        let whiteSpace: Character = " "
        let splitedInput = input.split(with: whiteSpace)
        
        return splitedInput.filter { operatorRawValues.contains($0) }
    }
}
