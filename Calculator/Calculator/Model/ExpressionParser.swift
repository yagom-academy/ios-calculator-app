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
            if $0.count == 1,
               let bindedOperator = Operator.init(rawValue: Character($0)) {
                switch bindedOperator {
                case .add:
                    result.operators.enqueue(Operator.add)
                case .subtract:
                    result.operators.enqueue(Operator.subtract)
                case .multiply:
                    result.operators.enqueue(Operator.multiply)
                case .divide:
                    result.operators.enqueue(Operator.divide)
                }
            } else {
                if let double = FormatConverter().convertStringContainingCommaToDouble($0) {
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
        return componentsByOperator(from: input).first == Operator.subtract.rawValue.description
    }
}
