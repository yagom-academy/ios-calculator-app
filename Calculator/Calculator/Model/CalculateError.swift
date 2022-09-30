//
//  CalculateError.swift
//  Calculator
//
//  Created by junho lee on 2022/09/27.
//

enum CalculateError: Error {
    case dividedByZero
    case unexpectedError
    
    var localizedDescription: String {
        switch self {
        case .dividedByZero:
            return "NaN"
        case .unexpectedError:
            return "예상하지 못한 에러"
        }
    }
}
