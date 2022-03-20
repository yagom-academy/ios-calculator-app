//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 김태현 on 2022/03/18.
//

fileprivate enum Separator {
    static let underScore: Character = "_"
}

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operandQueue = CalculatorItemQueue<Double>()
        let operatorQueue = CalculatorItemQueue<Operator>()
        
        componentsByOperators(from: input)
            .compactMap { Double($0) }
            .map { Node(data: $0) }
            .forEach { operandQueue.enqueue($0) }
        
        var lastValue: Character = Separator.underScore
        
        input
            .map {
                if let currentValue = Operator(rawValue: $0),
                   let _ = Double(String(lastValue)) {
                    lastValue = $0
                    return currentValue
                }
                lastValue = $0
                return nil
            }.compactMap { $0 }
            .map { Node(data: $0) }
            .forEach { operatorQueue.enqueue($0) }
        
        return Formula(operands: operandQueue, operators: operatorQueue)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        var result: [String] = []
        var lastValue: Character = Separator.underScore
        
        input
            .forEach {
                if let _ = Operator(rawValue: $0),
                   let _ = Double(String(lastValue)) {
                    result.append(String(Separator.underScore))
                } else {
                    result.append(String($0))
                }
                lastValue = $0
            }
        
        let stringResult: String = result.joined()
        
        return stringResult.split(with: Separator.underScore)
    }
}
