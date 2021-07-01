import Foundation

enum CalculatorError: Error {
    case emptyStackAccess
    case invalidElement
    case invalidInput
    case failedToFormat
}
