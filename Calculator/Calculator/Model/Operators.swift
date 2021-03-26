//
//  Operator.swift
//  Calculator
//
//  Created by 잼킹 on 2021/03/26.
//

import Foundation

enum Operators: String, CaseIterable {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    case not = "~"
    case and = "&"
    case nand = "~&"
    case or = "|"
    case nor = "~|"
    case xor = "^"
    case leftShift = "<<"
    case rightShift = ">>"
    case equal = "="
    
    var types: OperatorTypes {
        switch self {
        case .add, .subtract, .equal:
            return .common
        case .multiply, .divide:
            return .decimal
        default:
            return .binary
        }
    }

    var precedence: Int {
        switch self {
        case .not, .multiply, .divide, .and, .nand:
            return 160
        case .leftShift, .rightShift:
            return 140
        case .add, .subtract, .or, .nor, .xor:
            return 120
        case .equal:
            return 40
        }
    }
}
