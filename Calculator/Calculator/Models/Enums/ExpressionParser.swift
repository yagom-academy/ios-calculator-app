//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 노유빈 on 2022/09/22.
//

enum ExpressionParser {
    static func parser(from input: String) -> Formula {
        let formula = ExpressionParser.componentsByOperators(from: input)
        let operands = formula.compactMap { Double($0) }
        let operators = formula.compactMap { Operator(rawValue: Character($0)) }
        
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorsQueue = CalculatorItemQueue<Operator>()
        operandsQueue.push(operands)
        operatorsQueue.push(operators)        
        
        return Formula(operands: operandsQueue, operators: operatorsQueue)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        return input.map { String($0) }
    }
}
