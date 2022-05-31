//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Minseong Kang on 2022/05/27.
//

import Foundation

enum ExpressionParser {
    
    // MARK: - Action
    
    static func parse(from input: String) -> Formula {
        var resultOperands = CalculatorItemQueue<Double>()
        var resultOperators = CalculatorItemQueue<Operator>()

        let numbersParsedFromInput: [String] = componentsByOperators(from: input)
        let numbersToEnqueue: [Double] = numbersParsedFromInput.compactMap( { Double($0) } )
        numbersToEnqueue.forEach( { resultOperands.enqueue($0) } )
        
        let operatorsFromInput: [Operator] = input.compactMap( { Operator(rawValue: $0) } )
        operatorsFromInput.forEach( { resultOperators.enqueue($0) } )

        return Formula(operands: resultOperands, operators: resultOperators)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        var operators: CharacterSet = []
        Operator.allCases.forEach( { operators.insert(charactersIn: String($0.rawValue)) } )
        
        let numbersOnly: [String] = input.components(separatedBy: operators)
        return numbersOnly
    }
}
