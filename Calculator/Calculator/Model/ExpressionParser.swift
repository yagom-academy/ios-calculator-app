//
//  ExpressionParser.swift
//  Calculator
//
//  Created by hoon, hemg on 2023/06/06.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operandQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()
        
        let components = componentsByOperators(from: input)
        
        components
            .compactMap { Double($0) }
            .forEach { operandQueue.enqueue($0) }
        
        input
            .filter { $0.isNumber == false }
            .compactMap { Operator(rawValue: $0) }
            .forEach{ operatorQueue.enqueue($0) }
        
        let formula = Formula(operands: operandQueue, operators: operatorQueue)
        
        return formula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let operators = Operator.allCases.map { $0.rawValue }
        
        let components = operators.reduce([input]) { partialResult, `operator` in
            partialResult.map { $0.split(with: `operator`) }.flatMap{ $0 }
        }
        
        return components
    }
}
