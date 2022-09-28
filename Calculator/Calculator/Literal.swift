//
//  Literal.swift
//  Calculator
//
//  Created by Mangdi on 2022/09/28.
//

import Foundation

enum Literal {
    case numberZero
    case numberDoubleZero
    case numberPoint
    case numberOne
    case numberTwo
    case numberThree
    case numberFour
    case numberFive
    case numberSix
    case numberSeven
    case numberEight
    case numberNine
    case AC
    case CE
    case numberInvertion
    case division
    case multiplication
    case subtraction
    case addition
    case result
    
    var buttonID: String {
        switch self {
        case .numberZero:
            return "number_0"
        case .numberDoubleZero:
            return "number_00"
        case .numberPoint:
            return "number_point"
        case .numberOne:
            return "number_1"
        case .numberTwo:
            return "number_2"
        case .numberThree:
            return "number_3"
        case .numberFour:
            return "number_4"
        case .numberFive:
            return "number_5"
        case .numberSix:
            return "number_6"
        case .numberSeven:
            return "number_7"
        case .numberEight:
            return "number_8"
        case .numberNine:
            return "number_9"
        case .AC:
            return "button_AC"
        case .CE:
            return "button_CE"
        case .numberInvertion:
            return "number_Invertion"
        case .division:
            return "button_Division"
        case .multiplication:
            return "button_Multiplication"
        case .subtraction:
            return "button_Subtraction"
        case .addition:
            return "button_Addition"
        case .result:
            return "button_Result"
        }
    }
    
    var value: String {
        switch self {
        case .numberZero:
            return "0"
        case .numberDoubleZero:
            return "00"
        case .numberPoint:
            return "."
        case .numberOne:
            return "1"
        case .numberTwo:
            return "2"
        case .numberThree:
            return "3"
        case .numberFour:
            return "4"
        case .numberFive:
            return "5"
        case .numberSix:
            return "6"
        case .numberSeven:
            return "7"
        case .numberEight:
            return "8"
        case .numberNine:
            return "9"
        case .AC:
            return "0"
        case .CE:
            return "0"
        case .numberInvertion:
            return "0"
        case .division:
            return "/"
        case .multiplication:
            return "*"
        case .subtraction:
            return "-"
        case .addition:
            return "+"
        case .result:
            return "="
        }
    }
}
