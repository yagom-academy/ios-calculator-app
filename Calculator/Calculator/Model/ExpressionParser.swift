//  ExpressionParser.swift
//  Created by 레옹아범 on 2023/01/26.

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operatorsCases = Operator.allCases.map{ $0.rawValue }
        var components = ExpressionParser.componentsByOperators(from: input)
        
        var operators: [Operator] = []
        var operands: [Double] = []
        
        components.forEach { component in
            if let operand = component as? Double {
                operands.append(operand)
            } else {
                guard let operatorCase = Operator(rawValue: Character(component)) else { return }
                operators.append(operatorCase)
            }
        }
        
        return Formula(operands: CalculatorItemQueue(), operators: CalculatorItemQueue())
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
