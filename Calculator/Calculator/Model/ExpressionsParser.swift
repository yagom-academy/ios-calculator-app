//  ExpressionsParser.swift
//  Created by zhilly and Gundy on 2022/10/04.

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands: CalculatorItemQueue<Double> = .init()
        var operators: CalculatorItemQueue<Operator> = .init()
        
        componentsByOperators(from: input).compactMap(Double.init).forEach { operands.enqueue($0) }
        input.compactMap(Operator.init).forEach { operators.enqueue($0) }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operators = String(Operator.allCases.map(\.rawValue))
        let operatorsCharacterSet: CharacterSet = CharacterSet(charactersIn: operators)

        return input.components(separatedBy: operatorsCharacterSet)
    }
}
