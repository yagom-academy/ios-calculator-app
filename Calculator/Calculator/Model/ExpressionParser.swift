//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Minsup on 2023/05/31.
//

enum ExpressionParser {
    
    static func parse(from input: String) throws -> Formula {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        
        let items = try componentsByOperators(from: input)
        
        items.forEach { item in
            if let operand = Double(item) {
                operands.enqueue(operand)
            } else if let `operator` = Operator(rawValue: Character(item)) {
                operators.enqueue(`operator`)
            }
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) throws -> [String] {
        var currentNumber: String = ""        
        var tokens: [String] = []
        
        try input.forEach { char in
            switch char {
            case "0"..."9":
                currentNumber.append(char)
            case ".":
                currentNumber.append(char)
                if currentNumber.filter({ $0 == "." }).count > 1 {
                    throw CalculationError.invalidInputPoint
                }
            case "+", "-", "÷", "×":
                if !currentNumber.isEmpty {
                    tokens.append(currentNumber)
                    currentNumber = ""
                }
                tokens.append(String(char))
                
            default:
                throw CalculationError.invalidInputNumber
            }
        }
        
        guard currentNumber.filter({ $0 == "." }).count < 2 else { throw CalculationError.invalidInputPoint }
        
        if !currentNumber.isEmpty {
            tokens.append(currentNumber)
        } 
        
        return tokens
    }
}
