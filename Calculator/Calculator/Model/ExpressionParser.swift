//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Minsup on 2023/05/31.
//

enum ExpressionParser {    
    static func parse(from input: String) throws -> Formula {
        let validOperators: Set<Character> = ["+", "-", "÷", "×"]
        let items = componentsByOperators(from: input)
        
        let operands = items.compactMap { Double($0) }
        let operators = items.filter { validOperators.contains($0) }.compactMap { Operator(rawValue: Character($0)) }
        
        if items.count != operands.count + operators.count {
            throw CalculationError.invalidInput
        }
        
        return Formula(
            operands: CalculatorItemQueue<Double>(operands),
            operators: CalculatorItemQueue<Operator>(operators)
        )
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operators: Set<Character> = ["+", "-", "÷", "×"]
        var result: [String] = []
        var currentSegment: String = ""

        input.forEach { char in
            currentSegment.append(char)
            
            if operators.contains(char) {
                result.append(contentsOf: currentSegment.split(with: char))
                currentSegment = ""
            }
        }
        
        if !currentSegment.isEmpty {
            result.append(currentSegment)
        }
        
        return result
    }
}
