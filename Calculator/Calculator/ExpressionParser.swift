//  Created by bella on 2022/09/22.

import Foundation

enum ExpressionParser {
    
    static func parse(from input: String) -> Formula {
        let components = componentsByOperators(from: input)
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        
        components.forEach {
            if let doubleComponents = Double($0) {
                operands.enqueue(element: doubleComponents)
            }
            if let OperatorComponents = Operator(rawValue: Character($0)) {
                operators.enqueue(element: OperatorComponents)
            }
        }
        return Formula(operands: operands, operators: operators)
    }
    
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operators: [Character] = Operator.allCases.map{$0.rawValue}
        var strings: String = ""
        var result:[String] = []
        
        input.forEach {
            if operators.contains($0) == false {
                strings.append($0)
            } else {
                result.append(strings)
                result.append("\($0)")
                strings.removeAll()
            }
        }
        result.append(strings)
        return result
    }
}
