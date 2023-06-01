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
        let operators: Set<Character> = ["+", "-", "÷", "×"]
        var result: [String] = []
        var currentSegment: String = ""

        try input.forEach { char in
            currentSegment.append(char)
            
            guard char.isNumber || operators.contains(char) || char == "." else {
                throw CalculationError.invalidInputNumber
            }
            
            guard currentSegment.count(of: ".") < 2 else {
                throw CalculationError.invalidInputPoint
            }
            
            if operators.contains(char) {
                result.append(contentsOf: currentSegment.split(with: char))
                currentSegment = ""
            }
            
            if char == input.last {
                result.append(currentSegment)
            }
        }
        
        return result
    }
}
