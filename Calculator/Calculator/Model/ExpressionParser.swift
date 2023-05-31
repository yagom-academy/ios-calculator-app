//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Minsup on 2023/05/31.
//

enum ExpressionParser {
    
    static func parse(from input: String) -> Formula {
        
        var formula: Formula = Formula(
            operands: CalculatorItemQueue<Double>(),
            operators: CalculatorItemQueue<Operator>()
        )
        
        let items = componentsByOperators(from: input)
        
        items.forEach { item in
            if let `operator` = Operator(rawValue: Character(item)) {
                formula.operators.enqueue(`operator`)
            } else if let operand = Double(item) {
                formula.operands.enqueue(operand)
            } 
        }
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        
        var currentNumber: String = ""
        var tokens: [String] = []
        
        input.forEach { char in
            switch char {
            case "+", "-", "÷", "×":
                if !currentNumber.isEmpty {
                    tokens.append(currentNumber)
                    currentNumber = ""
                }
                tokens.append(String(char))
                
            default:
                currentNumber.append(char)
            }
        }
        
        return tokens
    }
}
