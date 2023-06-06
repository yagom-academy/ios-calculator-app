//
//  ExpressionParserMock.swift
//  CalculatorTests
//
//  Created by 비모 on 2023/06/06.
//
@testable import Calculator

enum ExpressionParserMock {
    static func parse(from input: String) -> Formula {
        let numbers = componentsByOperators(from: input).compactMap {
            Double($0)
        }
        
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        
        numbers.forEach {
            operands.enqueue($0)
        }
        
        input.compactMap {
            Operator(rawValue: $0)
        }
        .forEach {
            operators.enqueue($0)
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        var numbers: [String] = [input]
        
        Operator.allCases.forEach { `operator` in
            numbers = numbers.flatMap {
                $0.split(with: `operator`.rawValue)
            }
        }
        
        return numbers
    }
}
