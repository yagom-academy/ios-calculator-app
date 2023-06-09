//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Hmeg on 2023/06/06.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operandQueue = CalculatorItemQueue<Double>()
        let operatorQueue = CalculatorItemQueue<Operator>()
        
        let components = componentsByOperators(from: input)
        
        components
            .compactMap { Double($0) }
            .forEach { operandQueue.enqueue(item: $0) }
        
        input
            .filter { $0.isNumber == false }
            .compactMap { Operator(rawValue: $0) }
            .forEach{ operatorQueue.enqueue(item:$0) }
        
        let formula = Formula(operands: operandQueue, operators: operatorQueue)
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operators = Operator.allCases.map { $0.rawValue }
        
        let components = operators.reduce([input]) { partialResult, oper in
            partialResult.map { $0.split(with: oper) }.flatMap{ $0 }
        }
        
        return components
    }
}
