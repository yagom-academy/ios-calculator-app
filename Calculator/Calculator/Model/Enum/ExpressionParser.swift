//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 김동용 on 2022/05/18.
//

enum ExpressionParser {
    static func parse(from input: String) throws -> Formula {
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()
        
        let operands = input.compactMap{ Double(String($0)) }
        let operators = componentsByOperators(from: input)
                        .filter{$0.count == 1}
                        .compactMap{ Operator(rawValue: Character($0)) }
        
        operands.forEach{ operandsQueue.enQueue($0) }
        operators.forEach{ operatorQueue.enQueue($0) }
        
        return Formula(operands: operandsQueue,
                       operators: operatorQueue)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
