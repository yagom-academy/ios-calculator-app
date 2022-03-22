import Foundation

enum ExpressionParser {
//    static func parse(from input: String) -> Formula {}

    static private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
