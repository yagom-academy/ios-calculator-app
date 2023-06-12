//
//  ExpressionParser.swift
//  Calculator
//
//  Created by yyss99 on 2023/06/12.
//

// String을 나누기

enum ExpressionParser {
    
    static func parse(from input: String) -> Formula {
        var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
        var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
        
        let components = componentsByOperators(from: input)
        let operandsValues = components.filter { !["+", "-", "/", "*"].contains($0) }
        let operatorsValues = components.filter{ ["+", "-", "/", "*"].contains($0) }
        
        for value in operandsValues {
            guard let number = Double(value) else {
                continue // 안되면 걍 넘김
            }
            operands.enqueue(number)
        }

        for value in operatorsValues {
            guard let operatorChar = value.first,
                  let `operator` = Operator(rawValue: operatorChar) else {
                continue
            }
            operators.enqueue(`operator`)
        }
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
