//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 유제민 on 2022/09/30.
//

import UIKit

enum ExpresionParser {
    static func parse(from input: String) -> Formula {
        let componenets = componentsByOperators(from: input)
        var formula = Formula()

        let operators = componenets.filter { $0.count == 1 }
        operators.forEach{
            guard let operatorItem = Operator(rawValue: Character($0)) else { return }
            formula.operators.enqueue(data: operatorItem)
        }
        
        let operands = componenets.filter { value -> Bool in
            !operators.contains(value)
        }
        operands.forEach{
            guard let doubleItem = Double($0) else { return }
            formula.operands.enqueue(data: doubleItem)
        }
        
        return formula
    }
        
        
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: "/")
    }
}
