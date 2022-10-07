//
//  CalculatorError.swift
//  Calculator
//
//  Created by Kyo on 2022/09/23.
//

enum CalculatorError: Error {
    case noneOperand
    case noneOperator
    case convertFailToDouble
    case someError
    
    var message: String {
        switch self {
        case .noneOperand:
            return "None Operand Error"
        case .noneOperator:
            return "None Operator Error"
        case .convertFailToDouble:
            return "ConvertFail Error"
        case .someError:
            return "Some Error"
        }
    }
}
