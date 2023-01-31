//  ExpressionParser.swift
//  Created by 레옹아범 on 2023/01/26.

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operandValues = ExpressionParser.componentsByOperators(from: input)
        let operatorValues = Operator.allCases.map { String($0.rawValue) }
        
        let operators: [Operator] = input.split(with: " ").compactMap { component in
            if operatorValues.contains(component) {
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
        let inputs = input.split(with: " ").filter { value in
            return operatorValues.contains(value) == false
        }
        
        let components: [String] = inputs.map { component in
            if component.contains(",") {
                let newComponent = component.replacingOccurrences(of: ",", with: "")
                return newComponent
            }
            
            return component
        }
        
        return components
    }
}
