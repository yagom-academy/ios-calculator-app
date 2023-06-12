//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Erick on 2023/06/01.
//  Last modify : idinaloq, Erick, Maxhyunm

enum Expressionparser {
    static func parse(from input: String) -> Formula {
        var operands: CalculatorItemQueue = CalculatorItemQueue<Double>()
        var operators: CalculatorItemQueue = CalculatorItemQueue<Operator>()
        
        componentsByOperators(from: input).forEach { operand in
            if let operandElement = Double(operand) {
                operands.enqueue(operandElement)
            }
        }
    
        input.forEach { inputElement in
            if let operatorValue = Operator(rawValue: inputElement) {
                operators.enqueue(operatorValue)
            }
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var result: [String] = [input]
        
        Operator.allCases.forEach { operatorCase in
            result = result.flatMap { $0.split(with: operatorCase.rawValue) }
        }
        
        return result
    }
}
