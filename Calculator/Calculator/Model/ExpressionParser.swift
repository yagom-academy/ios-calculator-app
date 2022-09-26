//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Hamo on 2022/09/26.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var arithmeticOperator = CalculatorItemQueue<Operator>()
        var operands = CalculatorItemQueue<Double>()
        var operatorArray: [Character] = []
        var operandArray: [Double] = []
        let splitArray = input.split(with: "+")
        
        splitArray.forEach { element in
            if let operand = Double(element) {
                operandArray.append(operand)
            } else {
                operatorArray.append(Character(element))
            }
        }
        
        operandArray.forEach { element in
            operands.enqueue(element)
        }
        
        operatorArray.forEach { element in
            if let operatorCase = Operator(rawValue: element) {
                arithmeticOperator.enqueue(operatorCase)
            }
        }
        
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
