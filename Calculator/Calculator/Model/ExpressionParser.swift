//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Erick on 2023/06/01.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        var calculateItemList = componentsByOperators(from: input)
        
        calculateItemList.forEach { item in
            if let oper: Double = Double(item) {
                formula.operands.enqueue(oper)
            } else if let oper: Operator = Operator(rawValue: item) {
                formula.operators.enqueue(oper)
            }
        }
        
        return formula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
