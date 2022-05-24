//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Kiwi on 2022/05/20.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()
        
        let operands = componentsByOperators(from: input).compactMap{ Double($0) }
        let operators = componentsByOperators(from: input).filter{ Double($0) == nil }.compactMap{ Operator(rawValue: Character($0)) }
        
        operands.forEach{ operandsQueue.enqueue(data: $0 ) }
        operators.forEach{ operatorQueue.enqueue(data: $0 ) }
        
        return Formula(operands: operandsQueue, operators: operatorQueue)
    }
    
    private static func componentsByOperators(from input: String ) -> [String] {
        
        return input.split(with: " ")
        
    }
}


