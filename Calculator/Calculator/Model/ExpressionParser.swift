//
//  ExpressionParser.swift
//  Calculator
//
//  Created by kokkilE on 2023/01/27.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        let operatorsArray = input.split { Double(String($0)) != nil }
        let operandsArray = componentsByOperators(from: input)
        
        operatorsArray.forEach {
            if let operatorToChar = String($0).first,
               let operatorData = Operator(rawValue: operatorToChar) {
                let node = Node(operatorData)
                formula.operators.enqueueCalculateItems(node)
            }
        }

        operandsArray.compactMap { Double($0) }.forEach {
                let node = Node($0)
                formula.operands.enqueueCalculateItems(node)
            }
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var components = [String]()
        components.append(input)
        
        for target in Operator.allCases {
            var splitedComponents = [String]()
            
            components.forEach {
                splitedComponents += $0.split(with: target.rawValue)
            }
            
            components = splitedComponents
        }
        
        return components
    }
}
