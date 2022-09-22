//
//  ExpressionParser.swift
//  Calculator
//
//  Created by jin on 9/21/22.
//

import Foundation

enum ExpressionParser {
    
    static func parse(from input: String) -> Formula {
        
        let operands = CalculatorItemQueue<Double>()
        let operators = CalculatorItemQueue<Operator>()
        let components = componentsByOperators(from: input)
        
        components.compactMap{ Double($0) }.forEach { operand in
            operands.enqueue(item: operand)
        }
        
        components.filter({ $0.count == 1}).compactMap{ Operator(rawValue: Character($0))}.forEach { `operator` in
            operators.enqueue(item: `operator`)
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        
        let operators = CharacterSet(charactersIn: Operator.allCases.map{ String($0.rawValue) }.joined())
        return input.components(separatedBy: operators)
    }
}
