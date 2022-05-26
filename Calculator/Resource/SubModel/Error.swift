//
//  Error.swift
//  Calculator
//
//  Created by Kay on 2022/05/23.
//

import Foundation

enum valueError: Error {
    case operandEmpty
    case operatorEmpty
    case divideByZero
    
    var message: String {
        switch self {
        case .operandEmpty:
            return "숫자가 없습니다!"
        case .operatorEmpty:
            return "연산자가 없습니다!"
        case .divideByZero:
            return "0으로 나눌수 없습니다!"
        }
    }
}
