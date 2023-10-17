//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Kiseok on 2023/10/11.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let components = componentsByOperators(from: input)
        let operandsComponents = components.compactMap { Double($0) }
        let operatorsComponents = input.map { $0 }.compactMap { Operator(rawValue: $0) }
        let operands = CalculatorItemQueue<Double>(enqueueBox: operandsComponents)
        let operators = CalculatorItemQueue<Operator>(enqueueBox: operatorsComponents)
        
        return Formula(operands: operands, operators: operators)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        var result: [String] = [input]
        
        Operator.allCases.forEach { operatorSymbol in
            result = result.flatMap { $0.split(with: operatorSymbol.rawValue)
            }
        }
        
        return result
    }
}
