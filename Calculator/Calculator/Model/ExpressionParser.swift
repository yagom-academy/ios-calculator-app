//  ExpressionParser.swift
//  Created by 레옹아범 on 2023/01/26.

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let components = ExpressionParser.componentsByOperators(from: input)
        let operatorValues = Operator.allCases.map { String($0.rawValue) }
        
        let operators: [Operator] = components.compactMap { component in
            if operatorValues.contains(component) {
                return Operator(rawValue: Character(component))
            }
            
            return nil
        }
        
        let operands: [Double] = components.compactMap { component in
            return Double(component)
        }
        
        return Formula(operands: CalculatorItemQueue(elements: operands), operators: CalculatorItemQueue(elements: operators))
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let inputs = input.split(with: " ")
        
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
