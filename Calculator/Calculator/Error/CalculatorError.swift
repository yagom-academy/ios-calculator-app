enum CalculatorError: Error {
    case dividedByZero
    case unknownError
    
    var errorMessage: String {
        switch self {
        case .dividedByZero:
            return "NaN"
        case .unknownError:
            return "unknownError"
        }
    }
}
