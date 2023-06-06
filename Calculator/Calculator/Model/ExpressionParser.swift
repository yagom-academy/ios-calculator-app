//
//  ExpressionParser.swift
//  Calculator
//
//  Created by kangkyungmin on 2023/06/07.
//

enum ExpressionParser {
    static func parse(from input: String) throws -> Formula {
        var formula = Formula()
        let operatorSet = Operator.allCases
            .map{ $0.rawValue }
            .reduce("", { String($0) + String($1) })
        
        for element in componentsByOperators(from: input) {
            guard let doubleElement = Double(element) else {
                throw ConvertTypeError.invaildStringToDouble
            }
            
            formula.operands.enqueue(doubleElement)
        }
        
        for element in input.filter({ operatorSet.contains($0) }) {
            guard let operatorsElement = Operator(rawValue: element) else {
                throw ConvertTypeError.invaildRawValueToCase
            }
            
            formula.operators.enqueue(operatorsElement)
        }
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var components = [input]
        
        for operatorsElement in Operator.allCases {
            var newComponents = [String]()
            
            components.forEach{ element in
                newComponents.append(contentsOf: element.split(with: operatorsElement.rawValue))
            }
            
            components = newComponents
        }
        
        return components
    }
}
