import Foundation

enum CalculatorError: Error {
    case cannotDivideByZero
}

extension CalculatorError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .cannotDivideByZero:
            return "0으로 나눌 수 없습니다."
        }
    }
}
