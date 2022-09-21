//
//  ExpressionParser.swift
//  Calculator
//
//  Created by leewonseok on 2022/09/20.
//

enum ExpressionParser {
    static func parse(from input: String) throws -> Formula {
        var formula = Formula()
        
        componentsByOperator(from: input).compactMap{ Double($0) }.forEach {
            formula.operands.enqueue($0)
        }
        try input.compactMap { Double(String($0)) == nil ? $0 : nil }.forEach {
            guard let operatorSymbol = Operator(rawValue: $0) else { throw CalculatorError.operatorError }
            formula.operators.enqueue(operatorSymbol)
        }

        return formula
    }
    
    static private func componentsByOperator(from input: String) -> [String] {
        return input.compactMap { Double(String($0)) != nil ? String($0) : " " }.joined().components(separatedBy: " ")
    }
}
