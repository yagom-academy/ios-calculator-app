import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        let operators = Operator.allCases.map { String($0.rawValue) }
        let componentedInput = componentsByOperators(from: input)
        
        componentedInput.compactMap { Double($0) }
                        .forEach { formula.operands.enqueue($0) }
        
        componentedInput.filter { operators.contains($0) }
                        .compactMap { Operator(rawValue: Character($0)) }
                        .forEach { formula.operators.enqueue($0) }
        
        return formula
    }

    static private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
