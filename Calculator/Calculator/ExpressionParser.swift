//  Created by bella on 2022/09/22.

enum ExpressionParser {
    
//    static func parse(from input: String) -> Formula {
//        //input = "+ 5"
//        let a = componentsByOperators(from: input)
//        //["+", "5"]
//        //  0    1
//        let formula = a[0] + a[1]
//        return formula
//    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let components = input.map{String($0)}
        return components
    }
}
