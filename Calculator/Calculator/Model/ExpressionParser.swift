//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Hamo on 2022/09/26.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let arithmeticOperator = CalculatorItemQueue<Operator>()
        let operands = CalculatorItemQueue<Double>()
        
        return Formula(operands: operands, operators: arithmeticOperator)
    }
}

extension String {
    func split(with target: Character) -> String {
        
        return ""
    }
}
