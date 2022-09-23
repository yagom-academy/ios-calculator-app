//  Created by bella on 2022/09/22.

import Foundation

enum ExpressionParser {
    
    static func parse(from input: String) -> Formula {
        let components = componentsByOperators(from: input)
        var operands = components.compactMap{Double($0)}
        var operators = components.filter{$0.count == 1}.compactMap{Operator(rawValue: Character($0))?.rawValue}
        return Formula(operands: operands, operators: operators)
        // 뭔가 담는게 잘못됐나봐...
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let inputArray = [input]
        Operator.allCases.forEach{
            
        }
        
        let numbers = input.split(with: Operator.allCases.)
//        let components = input.map{String($0)}
        
        return numbers
    }
}

