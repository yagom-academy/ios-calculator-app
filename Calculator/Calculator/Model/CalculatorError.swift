import Foundation

enum CalculatorError: String, Error, LocalizedError {
    case queueIsEmpty
    case dividedByZero
    
    case includingAbnormalCharacter
    case firstOrLastComponentIsNotOperand
    case incorrectCountOfOperandsAndOperators
    case failedToInitializeFormulaInstance
    
    var description: String {
        switch self {
        case .queueIsEmpty:
            return "Dequeue 할 값이 존재하지 않습니다"
        case .dividedByZero:
            return "NaN (숫자 아님)"
        default:
            return rawValue
        }
    }
}
