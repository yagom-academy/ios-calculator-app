import Foundation

enum CalculatorComponent {
    case number
    case `operator`
    case equalSign
    case allClear
    case clearEntry
    case signConverter
    case dot
}

protocol CalculatorDelegate {
    func convertToPostfixExpression(fromInfix input: [String]) -> [String]
    func convertToComponentType(from userInput: String) throws -> CalculatorComponent
    func calculatePostfixExpression(postfix: [String]) -> NSNumber
}
