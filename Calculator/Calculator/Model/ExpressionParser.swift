//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Serena on 2023/06/05.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let componentParts = self.componentsByOperators(from: input)
        let numberParts: [Double] = componentParts.compactMap(Double.init)
        let stringPartsStandard = CharacterSet(charactersIn: componentParts.joined())
        let stringParts: [String] = input
            .components(separatedBy: stringPartsStandard)
            .filter { $0 != "" }
        
        return Formula(operands: CalculatorItemQueue(queue: numberParts),
                       operators: CalculatorItemQueue(queue: stringParts))
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let allOperatorRawValues = Operator.allCases.map{ $0.rawValue }
        let componentStandard = CharacterSet(charactersIn: String(allOperatorRawValues))
        let componentParts: [String] = input.components(separatedBy: componentStandard)
        
        return componentParts
    }
}
