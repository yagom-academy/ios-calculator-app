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
        
        operandElements.forEach {
            operands.enqueue(Double($0)!)
        }
        
        input.forEach {
            if !operandElements.contains(String($0)) {
                operators.enqueue(Operator(rawValue: $0)!)
            }
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var components = input
        let operators: [Character] = Operator.allCases.compactMap{ $0.rawValue }
        
        operators.forEach {
            components = components.split(with: $0).joined(separator: " ")
        }
        
        return components.split(with: " ")
    }
}

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    func result() -> Double {
        
        return 0.0
    }
}
