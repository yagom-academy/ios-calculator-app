//  ExpressionParser.swift
//  Created by 레옹아범 on 2023/01/26.

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let components = ExpressionParser.componentsByOperators(from: input)
        let operatorValues = Operator.allCases.map { String($0.rawValue) }
        var operators: [Operator] = []
        var operands: [Double] = []
        
        components.forEach { component in
            if operatorValues.contains(component),
               let operatorCase = Operator(rawValue: Character(component)) {
                operators.append(operatorCase)
                return
            }
            
            let operand = (component as NSString).doubleValue
            operands.append(operand)
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
