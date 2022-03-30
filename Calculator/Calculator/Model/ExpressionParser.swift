//
//  ExpressionParser.swift
//  Calculator
//
//  Created by marisol on 2022/03/18.
//

enum ExpressionParser {
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
    
    static func parse(from input: String) -> Formula {
        var operandQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()
        
        let operandList = componentsByOperators(from: input)
                            .compactMap{ Double($0) }
        
        let operatorList = componentsByOperators(from: input)
                            .filter{$0.count == 1}
                            .compactMap{ Operator(rawValue: Character($0))}
                        
        operandList.forEach{ operandQueue.enqueue($0) }
        operatorList.forEach{ operatorQueue.enqueue($0) }
        
        return Formula(
            operands: operandQueue,
            operators: operatorQueue
        )
    }
}
