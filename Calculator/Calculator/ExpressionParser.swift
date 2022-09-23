//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Mangdi on 2022/09/22.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let numberArray = componentsByOperators(from: input).map {  Double($0) }
        let operands = CalculatorItemQueue<Double>()
        var formula = Formula(operands: operands)
        
        for num in numberArray {
            formula.operands?.enqueue(num ?? 0)
        }
        
        return formula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let operandsArray = input.components(separatedBy: ["+", "-", "*", "/"])
        return operandsArray
    }
}
