//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Kiwi, Wongbing on 2022/05/20.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operandsQueue = CalculatorItemQueue<Double>(stack: [])
        var operatorQueue = CalculatorItemQueue<Character>(stack: [])
        
        let operands = componentsByOperators(from: input).compactMap{ Double($0) }
        let operators = componentsByOperators(from: input).filter{ Double($0) == nil }.compactMap { Character($0)}
        
        operands.forEach{ operandsQueue.enqueue($0) }
        operators.forEach{ operatorQueue.enqueue($0) }
        
        return Formula(operands: operandsQueue, operators: operatorQueue)
    }
    
    private static func componentsByOperators(from input: String ) -> [String] {
        let userInput = input.split(with: " ")
        return userInput
    }
}


