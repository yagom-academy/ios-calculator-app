//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Tiana, Eddy and Red on 2022/03/20.
//

fileprivate enum Const {
    static let whiteSpace: Character = " "
}

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operandQueue = CalculatorItemQueue<Double>()
        let operatorQueue = CalculatorItemQueue<Operator>()
        
        componentsByOperators(from: input)
            .compactMap { Double($0) }
            .forEach { operandQueue.enqueue($0) }
        
        componentsByOperators(from: input)
            .filter { $0.count == 1 }
            .compactMap { Operator(rawValue: Character($0)) }
            .forEach { operatorQueue.enqueue($0) }
        return Formula(operands: operandQueue, operators: operatorQueue)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: Const.whiteSpace)
    }
}
