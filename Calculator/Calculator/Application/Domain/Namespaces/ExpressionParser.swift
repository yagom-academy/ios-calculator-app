//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 나이든별, 민쏜
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let data = componentsByOperators(from: input)
        var operatorsQueue = CalculatorItemQueue<Operator>()
        var operandsQueue = CalculatorItemQueue<Double>()
        
        data.forEach {
            if let value = Double($0) {
                operandsQueue.enqueue(value)
            } else {
                let value = Character($0)
                if let `operator` = Operator(rawValue: value) {
                    operatorsQueue.enqueue(`operator`)
                }
            }
        }
        
        let formula = Formula(operands: operandsQueue, operators: operatorsQueue)
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var result = [input]
        
        Operator.allCases.forEach { `operator` in
            var newResult = [String]()
            result.forEach {
                let snippet = $0.split(with: `operator`.rawValue)
                newResult.append(contentsOf: snippet)
            }
            
            result = newResult
        }
        
        return result
    }
}
