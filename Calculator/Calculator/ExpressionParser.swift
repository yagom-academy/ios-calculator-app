//
//  ExpressionParser.swift
//  Calculator
//
//  Created by idinaloq on 2023/06/02.
//

enum Expressionparser {
    static func parse(from input: String) -> Formula {
        let operands: [String] = componentsByOperators(from: input)
        var formula: Formula = Formula()
        
        operands.forEach { operand in
            if let operandElement = Double(operand) {
                formula.operands.enqueue(operandElement)
            }
        }
        
        input.forEach { inputElement in
            if let operatorValue = Operator(rawValue: inputElement) {
                formula.operators.enqueue(operatorValue)
            }
        }
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var result: [String] = [input]
        
        Operator.allCases.forEach { operatorCase in
            result = result.flatMap { $0.split(with: operatorCase.rawValue) }
        }
        
        return result
    }
}
