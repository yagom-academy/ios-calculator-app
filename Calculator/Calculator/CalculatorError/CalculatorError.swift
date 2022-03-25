import Foundation

enum CalculatorError: Error {
    case cannotDivideByZero, outOfInputRange
}

extension CalculatorError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .cannotDivideByZero:
            return "0으로 나눌 수 없습니다."
        case .outOfInputRange:
            return "20자리 초과해서 입력할 수 없습니다."
        }
    }
}
