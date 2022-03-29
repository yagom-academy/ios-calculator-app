//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이시원 on 2022/03/18.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: "\(target)")
        }
}

enum ExpressionParser {
    private static func componentsByOperators(from input: String) -> [String] {
        var splitInput = input.trimmingCharacters(in: .whitespaces).split(with: " ")
        let operatorList = Operator.allCases.map { String($0.rawValue) }
        
        splitInput.removeAll(where: { operatorList.contains($0) })
        
        return splitInput
    }
    
    static func parse(from input: String) throws -> Formula {
        let operandQueue = CalculatorItemQueue<LinkdeList<Double>>(.init())
        let operatorQueue = CalculatorItemQueue<LinkdeList<Operator>>(.init())
        let operands = componentsByOperators(from: input)
        
        operands.compactMap{Double($0)}.forEach{operandQueue.enqueue($0)}
        input.split(with: " ").filter{$0.count == 1 && Operator(rawValue: Character($0))}.forEach{operatorQueue.enqueue($0)}
        
        return Formula(operands: operandQueue, operators: operatorQueue)
    }
}
