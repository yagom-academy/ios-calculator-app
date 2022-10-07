//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Hamo on 2022/09/26.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var arithmeticOperators = CalculatorItemQueue<Operator>()
        var operands = CalculatorItemQueue<Double>()
        let splitArray = componentsByOperators(from: input)
        
        splitArray.compactMap { Double($0) }
                  .forEach { operands.enqueue($0) }
        
        splitArray.filter { $0.count == 1 }
                  .compactMap { Operator(rawValue: Character($0)) }
                  .forEach { arithmeticOperators.enqueue($0) }
        
        return Formula(operands: operands, operators: arithmeticOperators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var result: [String] = [input]
        let operators = Operator.allCases.map { $0.rawValue }
        
        operators.forEach { element in
            result = result.map { $0.split(with: element) }.flatMap { $0 }
            
        }
        
        return result
    }
}
