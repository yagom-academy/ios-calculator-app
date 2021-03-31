//
//  OperatorType.swift
//  codingTest
//
//  Created by 윤재웅 on 2021/03/30.
//

import Foundation

enum resetType {
    static let reset = "c"
}

enum DecimalOperatorType: String, CaseIterable {
    case add = "+"
    case subtract = "-"
    case multiple = "*"
    case divide = "/"
    case equal = "="
    
    var priority: Bool {
        switch self {
        case .add, .subtract:
            return false
        case .multiple, .divide:
            return true
        case .equal:
            return true
        }
    }
}

extension DecimalOperatorType: CustomStringConvertible {
    var description: String {
        switch self {
        case .add:
            return "+"
        case .subtract:
            return "-"
        case .multiple:
            return "*"
        case .divide:
            return "/"
        case .equal:
            return "="
        }
    }
}

enum BinaryOperatorType: String, CaseIterable {
    case and = "&"
    case nand = "~&"
    case or = "|"
    case nor = "~|"
    case xor = "^"
    case not = "~"
    case leftShift = "<<"
    case rightShift = ">>"
    case equal = "="
}

extension BinaryOperatorType: CustomStringConvertible {
    var description: String {
        switch self {
        case .and:
            return "&"
        case .nand:
            return "~&"
        case .or:
            return "|"
        case .nor:
            return "~|"
        case .not:
            return "~"
        case .leftShift:
            return "<<"
        case .rightShift:
            return ">>"
        case .xor:
            return "^"
        case .equal:
            return "="
        }
    }
}
