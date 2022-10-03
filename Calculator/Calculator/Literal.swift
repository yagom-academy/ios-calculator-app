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
    case ac
    case ce
    case nan
    case numberInvertion
    case division
    case multiplication
    case subtraction
    case result
    case invertSign
    case infinity
    case comma
    case point
    
    var buttonID: String {
        switch self {
        case .numberZero:
            return "number_0"
        case .numberDoubleZero:
            return "number_00"
        case .numberPoint:
            return "number_point"
        case .ac:
            return "button_AC"
        case .ce:
            return "button_CE"
        case .numberInvertion:
            return "number_Invertion"
        case .division:
            return "button_Division"
        case .multiplication:
            return "button_Multiplication"
        case .subtraction:
            return "button_Subtraction"
        case .result:
            return "button_Result"
        case .nan:
            return "NaN"
        case .infinity:
            return "infinity"
        case .invertSign:
            return "invertSign"
        case .comma:
            return "comma"
        case .point:
            return "."
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
        case .ac:
            return "AC"
        case .ce:
            return "CE"
        case .numberInvertion:
            return "0"
        case .division:
            return "÷"
        case .multiplication:
            return "ⅹ"
        case .subtraction:
            return "-"
        case .result:
            return "="
        case .nan:
            return "NaN"
        case .infinity:
            return "+∞"
        case .invertSign:
            return "−"
        case .comma:
            return ","
        case .point:
            return "."
        }
    }
}
