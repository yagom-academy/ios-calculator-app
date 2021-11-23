import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        
        let numbers = componentsByOperators(from: input).compactMap { Double($0) }
        let operators = input.filter { Double($0.description) == nil }.compactMap { Operator.init(rawValue: $0) }
        
        numbers.forEach { formula.operands.enqueue($0) }
        operators.forEach { formula.operators.enqueue($0) }
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var result = input
        
        Operator.allCases.forEach { `operator` in
            result = result.replacingOccurrences(of: `operator`.rawValue.description, with: " ")
        }
        
        return result.split(with: " ")
    }
}
