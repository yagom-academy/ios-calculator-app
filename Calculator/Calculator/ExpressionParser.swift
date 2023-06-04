//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Hyungmin Lee on 2023/06/02.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operatorComponents = input.compactMap { Operator(rawValue: $0) }
        let operandComponents = componentsByOperators(from: input).compactMap { return Double($0) }
        var operatorQueue = CalculatorItemQueue<Operator>()
        var operandQueue = CalculatorItemQueue<Double>()
        
        operatorComponents.forEach{ operatorQueue.enqueue(element: $0) }
        operandComponents.forEach { operandQueue.enqueue(element: $0) }
        let formula = Formula(operands: operandQueue, operators: operatorQueue)
        
        return formula
    }
    
    static func componentsByOperators(from input: String) -> [String] {
//        return input.components(separatedBy: ["+", "−", "*", "/"])
        var remainString: String = input
        var operands = [String]()
        
        while true {
            var splitList: [String] = []
            
            for character in remainString {
                if let `operator` = Operator(rawValue: character) {
                    splitList = remainString.split(with: `operator`.rawValue)
                    break
                }
            }
            
            guard splitList.count != 0,
                  let operand = splitList.first,
                  let splitString = splitList.last else {
                operands.append(remainString)
                break
            }
            
            operands.append(operand)
            remainString = splitString
        }
        
        return operands
    }
}
