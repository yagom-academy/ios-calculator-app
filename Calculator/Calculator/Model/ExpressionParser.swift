//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Minsup on 2023/05/31.
//

enum ExpressionParser {    
    static func parse(from input: String) throws -> Formula {
        let validOperators = Operator.allCases.map { $0.rawValue }
        let components = componentsByOperators(from: input)
        
        let operands = components
            .compactMap { Double($0) }
        
        let operators = components
            .filter { validOperators.contains($0) && !$0.isEmpty }
            .compactMap { Operator(rawValue: Character($0)) }
        
        guard components.count == operands.count + operators.count else {
            throw CalculationError.invalidInput
        }
        
        guard operands.count == operators.count + 1 else {
            throw CalculationError.invalidInput
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operators = Operator.allCases.map { $0.rawValue }
        var result: [String] = []
        var currentSegment: String = ""
        
        input.forEach { char in
            currentSegment.append(char)
            
            if operators.contains(char) && currentSegment.filter({ !operators.contains($0)}).count > 0 {
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
