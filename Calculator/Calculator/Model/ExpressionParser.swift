//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 김인호 on 2022/09/22.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operands: CalculatorItemQueue<Double> = .init()
        let operators: CalculatorItemQueue<Operator> = .init()
        let operandsInInput = componentsByOperators(from: input).compactMap { Double($0) }
        let operatorsInInput = input.split(with: " ")
                                    .filter { $0.count == 1 }
                                    .compactMap { Operator(rawValue: Character($0)) }

        operandsInInput.forEach { operands.enqueue(element: $0) }
        
        operatorsInInput.forEach { operators.enqueue(element: $0) }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let separatedInput = input.split(with: " ")
        let components = separatedInput.filter { $0.filter({ $0.isNumber }).count != 0 }
        
        return components
    }
}
