//
//  BinaryOperator.swift
//  Calculator
//
//  Created by Yeon on 2020/12/09.
//

enum BinaryOperatorType: String, CaseIterable {
    case plus = "+"
    case minus = "-"
    case LeftShift = "<<"
    case RightShift = ">>"
    case AND = "&"
    case NAND = "~&"
    case OR = "|"
    case NOR = "~|"
    case XOR = "^"
    case NOT = "~"
}

enum BinaryOperatorPrecedence: Int {
    case high = 2
    case low = 1
    case zero = 0
}
