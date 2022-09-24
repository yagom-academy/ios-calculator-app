//  ExpressionParser.swift
//  Calculator
//  Created by LJ on 2022/09/23.

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula: Formula = Formula()
        let separatedOperands: Array<String> = input.components(separatedBy: ["+","-","*","/"])
        var convertArray: [String] = componentsByOperators(from: "10.0+20.0*3.0/2.0+3.0-2.0*9.0")
        
        let doubleNumbersOperands = separatedOperands.map{
            Double($0) ?? 99.999
        }
        for i in doubleNumbersOperands {
            formula.operands.enqueue(element: i)
        }
        for j in convertArray {
            let value: Operator = Operator.init(rawValue: j)
            formula.operators.enqueue(element: value)
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


