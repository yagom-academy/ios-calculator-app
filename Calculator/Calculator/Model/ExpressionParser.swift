
import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let formula = Formula()

        componentsByOperators(from: input).compactMap(Double.init).forEach(formula.operands.enqueue)
        input.compactMap(Operator.init).forEach(formula.operators.enqueue)
                
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
