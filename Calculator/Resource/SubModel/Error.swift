//
//  Error.swift
//  Calculator
//
//  Created by Kay on 2022/05/23.
//

import Foundation

enum valueError: Error {
    case operandEmptyError
    case operatorEmptyError
    case divideByZeroError
    
    var message: String {
        switch self {
        case .operandEmptyError:
            return "숫자가 없습니다!"
        case .operatorEmptyError:
            return "연산자가 없습니다!"
        case .divideByZeroError:
            return "0으로 나눌수 없습니다!"
        }
    }
}
