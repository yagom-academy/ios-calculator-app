//
//  Operator.swift
//  Calculator
//
//  Created by 잼킹 on 2021/03/26.
//

import Foundation

enum Operator: String, CaseIterable {
    case plus = "+"
    case subtrack = "-"
    case multiple = "*"
    case divide = "/"
    case not = "~"
    case and = "&"
    case notAnd = "~&"
    case or = "|"
    case notOr = "~|"
    case xor = "^"
    case leftShift = "<<"
    case rightShift = ">>"
    case equal = "="
    
    var kinds: CalculatorKinds {
        switch self {
        case .plus, .subtrack:
            return .common
        case .multiple, .divide:
            return .decimal
        default:
            return .binary
        }
    }
    
    var priority: Int {
        switch self {
        case .multiple, .divide:
            return 100
        case .plus, .subtrack:
            return 80
        case .equal:
            return 40
        default:
            return 60
        }
    }
}
