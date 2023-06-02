//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Min Hyun on 2023/05/31.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operatorsQueue = CalculatorItemQueue()
        var operandsQueue = CalculatorItemQueue()

        let operandComponents = self.componentsByOperators(from: input).compactMap { Double($0) }
        let operatorComponents = input.compactMap { Operator(rawValue: $0) }
        
        operandComponents.forEach { operandsQueue.enqueue($0) }
        operatorComponents.forEach { operatorsQueue.enqueue($0) }

        let result = Formula(operands:operandsQueue, operators: operatorsQueue)

        return result
    }
        
    static private func componentsByOperators(from input: String) -> [String] {
        let result = Operator.allCases.reduce([input]) { resultArray, operatorItem in
            resultArray.map { $0.split(with:operatorItem.rawValue) }.flatMap { $0 }
        }
        
        return result
    }
}
