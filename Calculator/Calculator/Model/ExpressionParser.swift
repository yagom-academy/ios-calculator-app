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
        let splitArray = componentsByOperators(from: input)
        
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
    
    private static func componentsByOperators(from input: String) -> [String] {
        var result: [String] = [input]
        let operatorArray = Operator.allCases.map { $0.rawValue }
        
        operatorArray.forEach { element in
            result = result.map { $0.split(with: element) }.flatMap { $0 }
            
        }
        
        return result
    }
}
