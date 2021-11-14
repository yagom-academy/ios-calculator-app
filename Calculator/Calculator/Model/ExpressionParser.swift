//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/12.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue()
        componentByOperators(from: input).compactMap { Double($0) }.forEach { operands.enqueue(number: $0) }
        
        var operators = CalculatorItemQueue()
        Operator.allCases.filter{ componentByOperators(from: input).contains( String($0.rawValue)) }.forEach { operators.enqueue(operatorItem: $0) }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentByOperators(from input: String) -> [String] {
        return Operator.allCases.map{ $0.rawValue }.reduce([input]) { (result,`operator`) in
            result.flatMap { $0.split(with: `operator` )} }
    }
}
