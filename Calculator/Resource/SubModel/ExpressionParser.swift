//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Kay on 2022/05/20.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operators = componentsByOperators(from: input)
        let operands = input.split { Operator.allCases.map({ String($0.rawValue) }).contains(String($0)) }.map(String.init)
        
        let compactOperaotrs = operators.compactMap({ $0 })
        let compactOperands = operands.compactMap({ $0 })
        
        let optionalOperators = compactOperaotrs.map { Operator(rawValue: Character($0))}
        let optionalOperands = compactOperands.map { Double($0) }
        
        let retrievedOperators = CalculatorItemQueue<Operator>(queue: optionalOperators, head: 0)
        let retrievedOperands = CalculatorItemQueue<Double>(queue: optionalOperands, head: 0)

        return Formula(operands: retrievedOperands, operators: retrievedOperators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.filter {$0 == "+" || $0 == "-" || $0 == "/" || $0 == "*" }.map { String($0) }
    }
}
