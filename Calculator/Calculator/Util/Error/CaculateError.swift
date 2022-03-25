import Foundation

enum CalculateError: Error {
    case wrongInputFormula
}

extension CalculateError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .wrongInputFormula:
            return "잘못된 입력입니다, 식을 다시 입력해 주세요"
        }
    }
}
