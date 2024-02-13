//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Jaehun Lee on 2/13/24.
//

protocol Parsable {
    static func parse(from input: String) -> Formula
}

enum ExpressionParser: Parsable {
    static func parse(from input: String) -> Formula {
        var operands: CalculatorItemQueue<Double> = .init()
        var operators: CalculatorItemQueue<Operator> = .init()
        
        let operandsArr = componentsByOperators(from: input)
            .compactMap(Double.init)
        let operatorsArr = input
            .compactMap(Operator.init)
        
        operandsArr.forEach { operands.enqueue(element: $0) }
        operatorsArr.forEach { operators.enqueue(element: $0) }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let inputThatOperatorTransposedWithBlank = input
            .map { Operator(rawValue: $0) != nil ? " " : String($0) }
            .joined()
        
        return inputThatOperatorTransposedWithBlank.split(with: " ")
    }
}
