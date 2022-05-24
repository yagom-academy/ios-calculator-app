//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이은찬 on 2022/05/20.
//

enum ExpressionParser {
    static func parse(from input: String) throws -> Formula {
        let componentedInput = componentByOperators(from: input)
        let operands: [Double] = componentedInput.compactMap { Double($0) }
        let `operators`: [Operator] = componentedInput.compactMap { Operator.init(rawValue: $0) }
        let formula = Formula(operands: operands, operators: `operators`)
        return formula
    }
    
    static private func componentByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
