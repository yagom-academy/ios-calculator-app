//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Kay on 2022/05/20.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operators = componentsByOperators(from: input)
        let operands = input.split { Operator.allCases.map({ String($0.rawValue) }).contains(String($0)) }.map { String($0) }

        var newOperands: [Double] = []
        operands.forEach {
            if $0.contains("&") {
                newOperands.append(Double(String($0.dropFirst()))! * -1)
            } else {
                newOperands.append(Double($0)!)
            }
        }
        
        let compactOperators = operators.compactMap({ $0 })
        let compactOperands = newOperands.compactMap({ $0 })
        
        let optionalOperators = compactOperators.map { Operator(rawValue: Character($0))}
        let optionalOperands = compactOperands.map { Double($0) }
        
        let retrievedOperators = CalculatorItemQueue<Operator>(queue: optionalOperators)
        let retrievedOperands = CalculatorItemQueue<Double>(queue: optionalOperands)

        return Formula(operands: retrievedOperands, operators: retrievedOperators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.filter { Operator.allCases.map({ String($0.rawValue) }).contains(String($0))}.map { String($0) }
    }
}
