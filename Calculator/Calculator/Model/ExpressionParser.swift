//
//  ExpressionParser.swift
//  Calculator
//
//  Created by kokkilE on 2023/01/27.
//

enum ExpressionParser<T: CalculateItem> {
    static func parse(from input: String) -> Formula<T> {
        var formula = Formula<T>()
        
        let operatorsArray = input.split { Double(String($0)) != nil }
        let operandsArray = componentsByOperators(from: input)
        
        operatorsArray.forEach {
            if let nodeData = String($0) as? T {
                let node = Node(nodeData)
                formula.operators.enqueueCalculateItems(node)
            }
        }
        operandsArray.forEach {
            if let nodeData = $0 as? T {
                let node = Node(nodeData)
                formula.operands.enqueueCalculateItems(node)
            }
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
