//
//  ExpressionParser.swift
//  Calculator
//
//  Created by jiye Yi on 2023/01/27.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let components = componentsByOperator(from: input)
        
        let operand: [Double] = components.compactMap { Double($0) }
        let operators: [Operator] = components.filter { $0.count == 1 }
            .compactMap { Operator(rawValue: Character($0)) }
        
        let operandValue = CalculatorItemQueue<Double>(items: operand)
        let operatorValue = CalculatorItemQueue<Operator>(items: operators)
        
        let result: Formula = Formula(operands: operandValue, operators: operatorValue)
        
        return result
    }
    
    private static func componentsByOperator(from input: String) -> [String] {
        var result: [String] = [input]
        
        Operator.allCases.forEach { `operator` in
            result = result.map {
                $0.split(with: `operator`.rawValue)
            }.flatMap { $0 }
        }
        return result
    }
    
}
