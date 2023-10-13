//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Kiseok on 2023/10/11.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let components = componentsByOperators(from: input)
        let operands = CalculatorItemQueue<Double>(enqueueBox: [])
        let operators = CalculatorItemQueue<Operator>(enqueueBox: [])
        let inputArray = input.map { $0 }
        var formula = Formula(operands: operands, operators: operators)
        
        inputArray.forEach {
            if let operators = Operator(rawValue: $0) {
                formula.operators.enqueue(operators)
            }
        }
        
        components.forEach {
            if let operands = Double($0) {
                formula.operands.enqueue(operands)
            }
        }
        
        return formula
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
