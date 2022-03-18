//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 김태현 on 2022/03/18.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operands = LinkedList<Double>()
        let operators = LinkedList<Operator>()
        
        componentsByOperators(from: input)
            .compactMap { Double($0) }
            .map { Node(data: $0) }
            .forEach { operands.append(node: $0) }
        
        input
            .compactMap { Operator(rawValue: $0) }
            .map { Node(data: $0) }
            .forEach { operators.append(node: $0) }
        
        let operandQueue = CalculatorItemQueue(linkedList: operands)
        let operatorQueue = CalculatorItemQueue(linkedList: operators)
        
        return Formula(operands: operandQueue, operators: operatorQueue)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        var result: [String] = []
        
        input.forEach {
            guard let _ = Operator(rawValue: $0) else {
                result.append(String($0))
                return
            }
            result.append("_")
        }
        
        let stringResult: String = result.joined()
        
        return stringResult.split(with: "_")
    }
}
