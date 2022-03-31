//
//  CalculatorError.swift
//  Calculator
//
//  Created by 이시원 on 2022/03/23.
//

import Foundation

enum CalauletorError: String, Error {
    case dividedByZero = "NaN"
    case invalidInputValue = "잘못된 입력입니다."
    case operandIsNil = "피연산자 입력이 잘못되었습니다."
    case operatorIsNil = "연산자 입력이 잘못되었습니다."
}

