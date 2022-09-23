//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Kyo on 2022/09/22.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operands = CalculatorItemQueue<Double>()
        let operators = CalculatorItemQueue<Operator>()
        let operatorTypes = Operator.allCases.map { String($0.rawValue) }

        let operandComponents = self.componentsByOperators(from: input)
        operandComponents.compactMap { Double($0) }.forEach { operands.enqueue($0) }
        
        let operatorComponents = input.map { String($0) }.filter { operatorTypes.contains($0) }
        operatorComponents.compactMap { Operator(rawValue: Character($0)) }.forEach { operators.enqueue($0) }
        
        return Formula(operands: operands, operators: operators)
    }

    private static func componentsByOperators(from input: String) -> [String] {
        let operatorTypes = Operator.allCases.map { String($0.rawValue) }
        var operatorSet: CharacterSet = CharacterSet()
        operatorTypes.forEach { operatorSet.insert(charactersIn: $0) }
        let components = input.components(separatedBy: operatorSet)

        return components
    }
    
}
