//
//  CalculatorError.swift
//  Calculator
//
//  Created by Wonhee on 2020/12/08.
//

import Foundation

enum CalculatorError: Error {
    case overFlow
    case divideByZero
    case unknowned
    case calculation
}

extension CalculatorError : LocalizedError {
    var errorDescription: String? {
        switch self {
        case .overFlow:
            return "9자릿수까지 입력할 수 있습니다."
        case .divideByZero:
            return "0으로 나눌 수 없습니다.\n다시 시도해 주세요."
        case .unknowned:
            return "알 수 없는 오류가 발생했습니다.\n다시 시도해 주세요."
        case .calculation:
            return "계산하는 중 오류가 발생했습니다.\n다시 시도해 주세요."
        }
    }
}
