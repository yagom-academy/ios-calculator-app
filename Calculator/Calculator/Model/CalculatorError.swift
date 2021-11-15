//
//  CalculatorError.swift
//  Calculator
//
//  Created by 권나영 on 2021/11/10.
//

import Foundation

enum CalculatorError: Error, CustomStringConvertible {
    case isEmptyStack
    case divideByZero
    
    var description: String {
        switch self {
        case .isEmptyStack:
            return "빈 배열입니다. dequeue할 요소가 없습니다."
        case .divideByZero:
            return "0으로 나눌 수 없습니다"
        }
    }
}
