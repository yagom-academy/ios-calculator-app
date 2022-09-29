//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Baem on 2022/09/24.
//
    
enum ExpressionParser {
    static func parse(from input: String) throws -> Formula {
        var operands = CalculatorItemQueue()
        var operators = CalculatorItemQueue()
        
        if isFirstIndexMinus(of: input) {
            operands.enqueue(0.0)
        }
        
        try componentsByOperator(from: input).forEach {
            switch $0 {
            case "+":
                operators.enqueue(Operator.add)
            case "-":
                operators.enqueue(Operator.subtract)
            case "*":
                operators.enqueue(Operator.multiply)
            case "/":
                operators.enqueue(Operator.divide)
            default:
                guard let double = Double($0) else {
                    throw ExpressionParserError.canNotChangeDouble
                }
                operands.enqueue(double)
            }
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperator(from input: String) -> [String] {
        return input.split(with: " ")
    }
    
    private static func isFirstIndexMinus(of input: String) -> Bool {
        if componentsByOperator(from: input).first == "-" {
            return true
        }
        
        return false
    }
}
