//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이시원 on 2022/03/18.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: " \(target) ")
    }
}

enum ExpressionParser {
    
    private static func compomnentsByOperators(from input: String) throws -> [String] {
        var value: [String] = [input]
        let operatorList = Operator.allCases
        
        for element in operatorList {
            value = value.flatMap { $0.split(with: element.rawValue) }
        }
        
        value = value.filter { !$0.isEmpty }
        
        guard value.count == value.compactMap({ Double($0) }).count else {
            throw CalauletorError.invalidInputValue
        }
        
        return value
    }
    
    static func parse(from input: String) throws -> Formula {
        let operandQueue = CalculatorItemQueue<LinkdeList<Double>>(.init())
        let operatorQueue = CalculatorItemQueue<LinkdeList<Operator>>(.init())
        let allElement = input.trimmingCharacters(in: .whitespaces).components(separatedBy: " ")
        let operands = try compomnentsByOperators(from: input).compactMap { Double($0) }
        let operators = allElement.filter { $0.count == 1 && Operator(rawValue: Character($0)) != nil }
        
        if allElement[0].count == 1 && Operator(rawValue: Character(allElement[0])) != nil {
            operandQueue.enqueue(0.0)
        }
        
        operands.forEach(operandQueue.enqueue(_:))
        
        operators.forEach {
            guard let opertorData = Operator(rawValue: Character($0)) else { return }
            operatorQueue.enqueue(opertorData)
        }

        return Formula(operands: operandQueue, operators: operatorQueue)
    }
}
