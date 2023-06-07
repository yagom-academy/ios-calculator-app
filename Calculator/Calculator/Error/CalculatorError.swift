//
//  CalculatorError.swift
//  Calculator
//
//  Created by 비모 on 2023/06/07.
//

enum CalculatorError: Error {
    case divisionError
    
    var message: String {
        switch self {
        case .divisionError:
            return "나눗셈을 할 수 없습니다."
        }
    }
}
