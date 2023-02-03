//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Jinah Park on 2023/01/27.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operandArray = componentsByOperators(from: input).compactMap { Double($0) }
        let operands: CalculatorItemQueue<Double> = .init(operandArray)
        
        let operatorArray = input.compactMap { Operator(rawValue: $0) }
        let operators: CalculatorItemQueue<Operator> = .init(operatorArray)
        
        let formula = Formula(operands: operands, operators: operators)
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var componentsByOperators = [input]
        
        Operator.allCases.forEach { operatorSymbol in
            componentsByOperators = componentsByOperators.flatMap { $0.split(with: operatorSymbol.rawValue) }
        }
        return componentsByOperators
    }
}
