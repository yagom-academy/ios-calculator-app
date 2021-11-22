import Foundation

enum CalculatorError: Error, LocalizedError {
    case queueIsEmpty
    case dividedByZero
    
    var description: String {
        switch self {
        case .queueIsEmpty:
            return "Dequeue 할 값이 존재하지 않습니다"
        case .dividedByZero:
            return "NaN (숫자 아님)"
        }
    }
}
