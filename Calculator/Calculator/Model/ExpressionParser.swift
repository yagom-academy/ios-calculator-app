//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 조민호 on 2022/03/18.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operands = makeOperandsQueue(from: input)
        let operators = makeOperatorsQueue(from: input)

        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        input.split(with: Character(Constant.whiteSpace))
            .compactMap { Double($0) }
            .map { String($0) }
    }
    
    private static func componentsByOperands(from input: String) -> [Operator] {
        let operatorTypes = Operator
            .allCases
            .map { String($0.rawValue) }
        
        return input.split(with: Character(Constant.whiteSpace))
            .filter { operatorTypes.contains($0) }
            .compactMap { Operator(rawValue: Character($0)) }
    }
    
    private static func makeOperandsQueue(from input: String) -> CalculatorItemQueue<Double> {
        var operands = CalculatorItemQueue<Double>()
        
        componentsByOperators(from: input)
            .compactMap { Double($0) }
            .forEach { operands.enqueue($0) }
        
        return operands
    }
    
    private static func makeOperatorsQueue(from input: String) -> CalculatorItemQueue<Operator> {
        var operators = CalculatorItemQueue<Operator>()
        
        componentsByOperands(from: input)
            .forEach { operators.enqueue($0) }
        
        return operators
    }
}
