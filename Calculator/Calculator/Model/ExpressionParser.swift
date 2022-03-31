//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이시원 on 2022/03/18.
//

import Foundation

enum ExpressionParser {
    private static func componentsByOperators(from input: String) -> [String] {
        var splittedInput = input.trimmingCharacters(in: .whitespaces).split(with: " ")
        let operatorList = Operator.allCases.map { String($0.rawValue) }
        
        splittedInput.removeAll(where: { operatorList.contains($0) })
        
        return splittedInput
    }
    
    private static func componentsByOperands(from input: String) -> [String] {
        var splittedInput = input.trimmingCharacters(in: .whitespaces).split(with: " ")
        let operandSet: Set<String> = Set(componentsByOperators(from: input))
        
        splittedInput.removeAll(where: { operandSet.contains($0) })
        
        return splittedInput
    }
    
    private static func isOperatorAtFirstElement(from input: String) -> Bool {
        let splittedInput = input.trimmingCharacters(in: .whitespaces).split(with: " ")
        
        guard let firstElement = splittedInput.first else { return false }
        
        if firstElement.count == 1 && Operator(rawValue: Character(firstElement)) != nil {
            return true
        } else {
            return false
        }
    }
    
    static func parse(from input: String) throws -> Formula {
        let operandQueue = CalculatorItemQueue<LinkdeList<Double>>(.init())
        let operatorQueue = CalculatorItemQueue<LinkdeList<Operator>>(.init())
        let operands = componentsByOperators(from: input)
        let operators = componentsByOperands(from: input)
        
        if isOperatorAtFirstElement(from: input) {
            operandQueue.enqueue(0.0)
        }
        
        guard operands.count == operands.compactMap({ Double($0) }).count else {
            throw CalauletorError.invalidInputValue
        }
        
        operands.compactMap { Double($0) }.forEach { operandQueue.enqueue($0) }
        
        operators.compactMap ({ Operator(rawValue: Character($0)) }).forEach { operatorQueue.enqueue($0) }
        
        return Formula(operands: operandQueue, operators: operatorQueue)
    }
}
