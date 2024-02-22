//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Yejin Hong on 2024/02/13.
//
import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operandElements = componentsByOperators(from: input)
        
        var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
        var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
        
        operandElements
            .compactMap { Double($0) }
            .forEach { operands.enqueue($0) }
        
        input
            .compactMap { Operator(rawValue: $0) }
            .forEach { operators.enqueue($0) }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var components = input
        let operators: [Character] = Operator.allCases.compactMap{ $0.rawValue }
        
        operators.forEach {
            components = components.replacingOccurrences(of: String($0), with: " ")
        }
        
        return components.split(with: " ")
    }
}

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        var result = operands.dequeue() ?? 0.0
        
        while let operand = operands.dequeue() {
            guard let `operator` = operators.dequeue() else {
                return .nan
            }
            
            result = `operator`.calculate(lhs: result, rhs: operand)
        }
        
        return result
    }
}
