//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Minseong Kang on 2022/05/27.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var resultOperands = CalculatorItemQueue<Double>()
        var resultOperators = CalculatorItemQueue<Operator>()

        let numbersParsedFromInput: [String] = componentsByOperators(from: input)
        let numbersToEnqueue: [Double] = numbersParsedFromInput.compactMap( { Double($0) } )
        numbersToEnqueue.forEach( { resultOperands.enqueue($0) } )
        
        for char in input {
            if let eachOperator = Operator(rawValue: char) {
                resultOperators.enqueue(eachOperator)
            }
        }
 
        return Formula(operands: resultOperands, operators: resultOperators)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        var operators: CharacterSet = []
        Operator.allCases.forEach( { operators.insert(charactersIn: String($0.rawValue)) } )
        
        let numbersOnly: [String] = input.components(separatedBy: operators)
        return numbersOnly
    }
}
