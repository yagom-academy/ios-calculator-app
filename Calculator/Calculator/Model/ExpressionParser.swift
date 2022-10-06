//
//  ExpressionParser.swift
//  Calculator
//
//  Created by junho lee on 2022/09/23.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var result: Formula = Formula()
        if isFirstCharacterMinus(of: input) {
            result.operands.enqueue(0.0)
        }
        componentsByOperator(from: input).forEach {
            switch $0 {
            case String(Operator.add.rawValue):
                result.operators.enqueue(Operator.add)
            case String(Operator.subtract.rawValue):
                result.operators.enqueue(Operator.subtract)
            case String(Operator.multiply.rawValue):
                result.operators.enqueue(Operator.multiply)
            case String(Operator.divide.rawValue):
                result.operators.enqueue(Operator.divide)
            default:
                if let double = Converter().convertStringContainingCommaToDouble($0) {
                    result.operands.enqueue(double)
                }
            }
        }
        return result
    }
    
    private static func componentsByOperator(from input: String) -> [String] {
        return input.split(with: " ")
    }
    
    private static func isFirstCharacterMinus(of input: String) -> Bool {
        return componentsByOperator(from: input).first == "-"
    }
}
