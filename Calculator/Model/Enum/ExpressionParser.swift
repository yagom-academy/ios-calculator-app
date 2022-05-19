//
//  ExpressionParser.swift
//  Calculator
//
//  Created by NAMU on 2022/05/19.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        var removeOperator = input
        
        try? componentsByOperators(from: removeOperator).forEach {
            removeOperator = removeOperator.replacingOccurrences(of: $0, with: " ")
            guard let operators = Operator.init(rawValue: Character($0)) else {
                throw CalculateError.nilError
            }
            formula.operators.enqueue(data: operators )
        }
        
        removeOperator.split(with: " ").forEach {
            guard let operand = Double($0) else {
                return
            }
            formula.operands.enqueue(data: operand)
            print(operand)
        }
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let result = input.filter{ !$0.isNumber }.map{ String($0) }
        return result
    }
}
