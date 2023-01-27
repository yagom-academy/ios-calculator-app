//  Calculator - ExpressionParser.swift
//  created by vetto on 2023/01/27
import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()
        let operands = componentsByOperators(from: input).compactMap { Double($0) }
        
        for operand in operands {
            operandsQueue.enqueue(operand)
        }
        
        for inputCharacter in input {
            guard let `operator` = Operator(rawValue: inputCharacter),
                  !inputCharacter.isNumber else { continue }
            operatorQueue.enqueue(`operator`)
        }
        
        return Formula(operands: operandsQueue, operators: operatorQueue)
    }
    private static func componentsByOperators(from input: String) -> [String] {
        var operatorSet = CharacterSet()
        for `operator` in Operator.allCases {
            operatorSet.insert(charactersIn: String(`operator`.rawValue))
        }
        
        return input.components(separatedBy: operatorSet).filter{ $0 != "" }
    }
}
