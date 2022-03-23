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
    
    private static func compomnentsByOperators(from input: String) -> [String] {
        var value: [String] = [input]
        let operatorList = Operator.allCases
        
        for element in operatorList {
            value = value.flatMap { $0.split(with: element.rawValue) }
        }
        
        return value
    }
    
    static func parse(from input: String) -> Formula {
        let operatorList: [String] = ["+", "-", "÷", "×"]
        let operandQueue = CalculatorItemQueue<LinkdeList<Double>>(LinkdeList<Double>())
        let operatorQueue = CalculatorItemQueue<LinkdeList<Operator>>(LinkdeList<Operator>())
        let allElement = input.trimmingCharacters(in: .whitespaces).components(separatedBy: " ")
        let operands = compomnentsByOperators(from: input).compactMap { Double($0) }
        let operators = allElement.filter { operatorList.contains($0) }
        
        if operatorList.contains(allElement[0]) {
            operandQueue.enqueue(0.0)
        }
        
        operands.forEach(operandQueue.enqueue(_:))
        
        operators.forEach {
            guard let data = Operator(rawValue: Character($0)) else { return }
            operatorQueue.enqueue(data)
        }

        return Formula(operands: operandQueue, operators: operatorQueue)
    }
}
