//
//  ExpressionParser.swift
//  Calculator
//
//  Created by jin on 9/21/22.
//

import Darwin

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
        
        var result: [String] = []
        var operand = ""
        
        for char in input {
            if Operator(rawValue: char) != nil {
                result.append(operand)
                result.append(String(char))
                operand = ""
            } else {
                operand += String(char)
            }
        }
        result.append(operand)
        
        return result
    }
}
