//
//  ExpressionParser.swift
//  Calculator
//

//  Created by bard, hugh on 2022/05/30.


enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        
        input.filter {
            Double(String($0)) == nil
        }.forEach {
            guard let sign = Operator(rawValue: $0) else { return }
            formula.operators.enQueue(sign)
        }
        
        componentsByOperators(from: input).compactMap {
            Double($0)
        }.forEach {
            formula.operands.enQueue($0)
        return formula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        var newInput = input
            
        let sign = Operator.allCases.map {
            $0.rawValue
        }
        sign.forEach {
            newInput = newInput.replacingOccurrences(of: String($0), with: " ")
        }
        return newInput.split(with: " ")
    }
}
