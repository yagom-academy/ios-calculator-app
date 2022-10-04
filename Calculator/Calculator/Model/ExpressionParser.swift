//
//  ExpressionParser.swift
//  Calculator
//
//  Created by junho lee on 2022/09/23.
//

enum ExpressionParser {
    static func parse(from input: String) throws -> Formula {
        var result: Formula = Formula()
        
        if isFirstIndexMinus(of: input) {
            result.operands.enqueue(0.0)
        }
        
        try componentsByOperator(from: input).forEach {
            switch $0 {
            case String(Operator.add.rawValue):
                result.operators.enqueue(Operator.add)
            case "−":
                result.operators.enqueue(Operator.subtract)
            case "×":
                result.operators.enqueue(Operator.multiply)
            case "÷":
                result.operators.enqueue(Operator.divide)
            default:
                guard let double = Double.convertStringContainingCommaToDouble($0) else {
                    throw ExpressionParserError.canNotChangeDouble
                }
                result.operands.enqueue(double)
            }
        }
        
        return result
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
