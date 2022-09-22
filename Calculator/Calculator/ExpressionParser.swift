//  Created by bella on 2022/09/22.

import Foundation

enum ExpressionParser {
    
//    static func parse(from input: String) -> Formula {
//        let components = componentsByOperators(from: input)
//        let operands : CalculatorItemQueue<Double>
//        let operators : CalculatorItemQueue<Operator>
        
        //        var filtered = components.filter{ $0 == Operator.RawValue }
        
        
        // ["1", "+", "2", "*", "4"]
        //        for component in components {
        
        //            if let b = Operator.self.RawValue {
        //                operators.enqueue(element: b)
        //            } else {
        //                if let a = Double(component) {
        //                    operands.enqueue(element: a)
        //                }
        //        }
        //    return Formula(operands: operands, operators: operators)
        //}
//    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let components = input.map{String($0)}
        return components
    }
}
