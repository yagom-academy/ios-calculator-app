//  ExpressionParser.swift
//  Calculator
//  Created by LJ on 2022/09/23.

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula: Formula = Formula()
        
        let separatedOperands: [String] = input.components(separatedBy: ["+","-","*","/"])
        let convertedToDoubleOperands = separatedOperands.map{
            Double($0) ?? 99.999
        }
        for operand in convertedToDoubleOperands {
            formula.operands.enqueue(element: operand)
        }
        
        let separatedOperators: [String] = componentsByOperators(from: "10.0+20.0*3.0/2.0+3.0-2.0*9.0")
        for stringOperator in separatedOperators {
            let convertedToCaseOperators: Operator = Operator.init(rawValue: stringOperator)
            formula.operators.enqueue(element: convertedToCaseOperators)
        }
        return formula
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        return input.filter {
            ($0 == "+") || ($0 == "-") || ($0 == "*") || ($0 == "/")
        }.map {
            String($0)
        }
    }
}


