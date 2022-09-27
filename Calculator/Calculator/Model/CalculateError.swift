//
//  CalculateError.swift
//  Calculator
//
//  Created by junho lee on 2022/09/27.
//

enum CalculateError: Error {
    case dividedByZero
    
    var localizedDescription: String {
        switch self {
        case .dividedByZero:
            return "0으로 나눌 수 없습니다."
        }
    }
}
