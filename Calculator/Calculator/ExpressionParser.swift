//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 무리 on 2023/01/30.
//

import Foundation

enum ExpressionParser {
    
    static func parse(from input: String) -> Formula {
        let components = componentsByOperators(from: input)
        let operands = CalculatorItemQueue<Double>()
        let operators = CalculatorItemQueue<Operator>()

        return Formula(operands: <#T##CalculatorItemQueue<Double>#>, operators: <#T##CalculatorItemQueue<Operator>#>)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let splitedInput = input.split(with: " ")
        
        return splitedInput
    }
}
