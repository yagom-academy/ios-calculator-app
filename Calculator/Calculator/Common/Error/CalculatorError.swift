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
    
    static let noneOperandMessage: String = "None Operand Error"
    static let noneOperatorMessage: String = "None Operator Error"
    static let convertFailToDoubleMessage: String = "ConvertFail Error"
    static let errorMessage: String = "Some Error"
    
}
