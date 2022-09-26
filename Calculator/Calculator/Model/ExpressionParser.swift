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
    func split(with target: Character) -> [String] {
        var result: [String] = []
        var nonTargetArray: [String] = []

        self.forEach { character in
            if character == target {
                result.append(nonTargetArray.joined(separator: ""))
                result.append(String(character))
                nonTargetArray = []
            } else {
                nonTargetArray.append(String(character))
            }
        }
        
        result.append(nonTargetArray.joined(separator: ""))
        return result
    }
}
