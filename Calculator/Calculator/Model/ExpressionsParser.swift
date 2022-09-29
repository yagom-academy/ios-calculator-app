//  ExpressionsParser.swift
//  Created by zhilly on 2022/09/26.
import Foundation

enum ExpressionParser {
    static func parse (from input: String) -> Formula {
        var operands: CalculatorItemQueue = CalculatorItemQueue<Double>()
        var operators: CalculatorItemQueue = CalculatorItemQueue<Operator>()
        
        let operandsComponentArray = componentsByOperators(from: input).compactMap { str in Double(str) }
        operandsComponentArray.forEach {
            operands.enqueue($0)
        }
        
        let operatorComponentArray = input.compactMap{ Operator(rawValue: $0) }
        operatorComponentArray.forEach {
            operators.enqueue($0)
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operators = String(Operator.allCases.map { $0.rawValue })
        let operatorsCharacterSet: CharacterSet = CharacterSet(charactersIn: operators)

        return input.components(separatedBy: operatorsCharacterSet)
    }
}
