//
//  FormulaError.swift
//  Calculator
//
//  Created by Gundy on 2022/09/22.
//

enum FormulaError: Error {
    case divideByZero
    case unexpectedError
    
    var localizedDescription: String {
        switch self {
        case .divideByZero:
            return "0으로는 나눌 수 없습니다."
        case .unexpectedError:
            return "예상하지 못한 에러입니다."
        }
    }
}
