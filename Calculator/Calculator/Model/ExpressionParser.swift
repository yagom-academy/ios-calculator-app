//  ExpressionParser.swift
//  Created by 레옹아범 on 2023/01/26.

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operandValues = ExpressionParser.componentsByOperators(from: input)
        
        let operators: [Operator] = input.split(with: " ")
            .filter { $0.count == 1}
            .compactMap { component in
            return Operator(rawValue: Character(component))
        }
        
        let operands: [Double] = operandValues.compactMap { Double($0) }
        
        return Formula(operands: CalculatorItemQueue(elements: operands), operators: CalculatorItemQueue(elements: operators))
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let operatorValues = Operator.allCases.map { $0.rawValue }
        let components = input.split(with: " ").filter { value in
            return operatorValues.contains(value) == false
        }
        
        return components
    }
}
