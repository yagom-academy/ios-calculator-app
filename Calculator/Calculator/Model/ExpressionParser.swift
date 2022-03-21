import Foundation

enum ExpressionParser {
    private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
