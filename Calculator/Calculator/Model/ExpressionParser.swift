//  ExpressionParser.swift
//  Created by 레옹아범 on 2023/01/26.

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operandValues = ExpressionParser.componentsByOperators(from: input)
        let operatorCases = Operator.allCases.map { String($0.rawValue) }
        
        let operators: [Operator] = input.split(with: " ").compactMap { component in
            if operatorCases.contains(component) {
                return Operator(rawValue: Character(component))
            }
            
            return nil
        }
        
        let operands: [Double] = operandValues.compactMap { component in
            return Double(component)
        }
        
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
