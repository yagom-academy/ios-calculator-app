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
        let numberPartsStandard = CharacterSet(charactersIn: componentParts.joined())
        let numberPartsAsString: [String] = input.components(separatedBy: numberPartsStandard)
        let numberParts: [Double] = numberPartsAsString.compactMap(Double.init)
        
        return Formula(operands: CalculatorItemQueue(queue: numberParts),
                       operators: CalculatorItemQueue(queue: componentParts))
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let componentStandard = CharacterSet(charactersIn: String(Operator.allCases.map({$0.rawValue})))
        let componentParts: [String] = input.components(separatedBy: componentStandard)

        return componentParts
    }
}
