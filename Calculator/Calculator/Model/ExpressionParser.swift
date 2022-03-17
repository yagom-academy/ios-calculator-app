//
//  ExpressionParser.swift
//  Calculator
//
//  Created by DuDu on 2022/03/18.
//

enum ExpressionParser {
    private static func componentsByOperatos(from input: String) -> [String] {
        return input.split(with: " ")
    }
    
    static func parse(from input: String) -> Formula {
        let operandQueue = CalculatorItemQueue<Double>()
        let operatorQueue = CalculatorItemQueue<Operator>()
        
        let operandList = componentsByOperatos(from: input)
                            .compactMap{ Double($0) }
        
        let operatorList = componentsByOperatos(from: input)
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
