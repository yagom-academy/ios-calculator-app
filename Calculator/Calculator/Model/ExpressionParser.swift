import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let formulaArray = componentsByOperators(from: input)
        var formula = Formula()

        for element in formulaArray {
            if let number = Double(element) {
                formula.operands.enqueue(number)
                continue
            }
            if let operation = Operator(rawValue: Character(element)) {
                formula.operations.enqueue(operation)
            }
        }
        return formula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
