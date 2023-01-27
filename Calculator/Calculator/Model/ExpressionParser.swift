//  ExpressionParser.swift
//  Created by 레옹아범 on 2023/01/26.

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operators = Operator.allCases.map { $0.rawValue }
        var components = ExpressionParser.componentsByOperators(from: input)
        
        
        components.forEach { component in
            <#code#>
        }
        
        return Formula(operands: CalculatorItemQueue(), operators: CalculatorItemQueue())
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        let operators = Operator.allCases.map { $0.rawValue }
        var number: String = ""
        var components: [String] = []
        
        input.forEach { atom in
            if operators.contains(atom) {
                components.append(number)
                components.append("\(atom)")
            } else {
                number += "\(atom)"
            }
        }
        
        return components
    }
}
