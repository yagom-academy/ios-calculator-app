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
            .forEach {
                guard let operand = Double($0) else {
                    return
                }
                operandQueue.enqueue(Node(data: operand))
            }
        
        var lastValue: Character = Separator.underScore
        
        input
            .map { (currentValue: Character) -> Operator? in
                if let currentOperator: Operator = Operator(rawValue: currentValue),
                   let _ = Double(String(lastValue)) {
                    lastValue = currentValue
                    return currentOperator
                }
                lastValue = currentValue
                return nil
            }
            .forEach {
                guard let tmp: Operator = $0 else {
                    return
                }
                operatorQueue.enqueue(Node(data: tmp))
            }
        
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
