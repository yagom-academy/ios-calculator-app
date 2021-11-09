//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/09.
//

import Foundation

enum ExpressionParser {
    case a
    
    func parse(from input: String) -> Formula {
        let operands = CalculatorItemQueue<Double>()
        let operators = CalculatorItemQueue<Character>()
        
        return Formula(operands: operands, operators: operators)
    }
    
    private func componentsByOperators(from input: String) -> [String] {
        return input.components(separatedBy: " ")
    }
}
