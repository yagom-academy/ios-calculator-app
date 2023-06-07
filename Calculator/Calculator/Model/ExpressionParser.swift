//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 비모 on 2023/06/06.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        
        componentsByOperators(from: input).compactMap {
            Double($0)
        }
        .forEach {
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
    
    static private func componentsByOperators(from input: String) -> [String] {
        var numbers: [String] = [input]
        
        Operator.allCases.forEach { `operator` in
            numbers = numbers.flatMap {
                $0.split(with: `operator`.rawValue)
            }
        }
        
        return numbers
    }
}
