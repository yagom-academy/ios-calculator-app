//
//  ExpressionParser.swift
//  Calculator
//
//  Created by jin on 9/21/22.
//

import Foundation

enum ExpressionParser {
    
    static func parse(from input: String) -> Formula {
        
        let operands: CalculatorItemQueue<Double> = .init()
        let operators: CalculatorItemQueue<Operator> = .init()
        let components = componentsByOperators(from: input)
        
        components.compactMap{ Double($0) }.forEach{ operands.enqueue(item: $0) }
        input.map{ $0 }.compactMap{ Operator(rawValue: $0) }.forEach{ operators.enqueue(item: $0) }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        
        let operators = CharacterSet(charactersIn: Operator.allCases.map{ String($0.rawValue) }.joined())
        
        return input.components(separatedBy: operators)
    }
}
