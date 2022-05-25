enum CalculatorError: Error {
    case dividedByZero
    case unknownError
    
    
    var errorCaseNumber: Double {
        switch self {
        case .dividedByZero:
            return 0.0
        case .unknownError:
            return  1.0
        }
    }
    
    var errorMessage: String {
        switch self.errorCaseNumber {
        case 0.0:
            return "NaN"
        default:
            return "unknownError"
        }
    }
}
