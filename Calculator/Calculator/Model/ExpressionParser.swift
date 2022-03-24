
import Foundation

enum ExpressionParser {
    
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        let components = componentsByOperators(from: input)
        
        components.compactMap { Double($0) }.forEach { formula.operands.enqueue($0) }
        components.filter {$0.count == 1}.compactMap { Operator(rawValue: Character($0)) }.forEach { formula.operators.enqueue($0) }
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String]  {
       return input.split(with: " ")
        
    }
}
