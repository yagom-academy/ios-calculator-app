//  ExpressionParser.swift
//  Created by 레옹아범 on 2023/01/26.

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operatorsCases = Operator.allCases.map{ $0.rawValue }
        var components = ExpressionParser.componentsByOperators(from: input)
        
        var operators: [Operator] = []
        var operands: [Double] = []
        
        components.forEach { component in
            if let operatorCase = Operator(rawValue: Character(component)) {
                operators.append(operatorCase)
            } else {
                let operand = (component as NSString).doubleValue
                operands.append(operand)
            }
        }
        
        return Formula(operands: CalculatorItemQueue(elements: operands), operators: CalculatorItemQueue(elements: operators))
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        let operatorsCases = Operator.allCases.map { $0.rawValue }
        var number: String = ""
        var components: [String] = []
        
        input.forEach { atom in
            if operatorsCases.contains(atom) {
                components.append(number)
                components.append("\(atom)")
            } else {
                number += "\(atom)"
            }
        }
        
        return components
    }
}
