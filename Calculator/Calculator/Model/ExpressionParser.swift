import Foundation

enum ExpressionParser {
    static func parse(from input: String) throws -> Formula {
        var formula = Formula()
        let componentedInput = componentsByOperators(from: input)
        
        componentedInput.compactMap { Double($0) }
                        .forEach { formula.operands.enqueue($0) }
        
        componentedInput.filter { Operator.characterToString().contains($0) }
                        .compactMap { Operator(rawValue: Character($0)) }
                        .forEach { formula.operators.enqueue($0) }

        guard formula.operands.count - 1 == formula.operators.count else {
            throw CalculateError.wrongInputFormula
        }
        
        return formula
    }

    static private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
