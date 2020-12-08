//
//  OperatorType.swift
//  Calculator
//
//  Created by Wonhee on 2020/12/08.
//

import Foundation

enum DecimalOperatorType: String, CaseIterable {
    case divide = "/"
    case multiple = "*"
    case minus = "-"
    case plus = "+"
}

enum BinaryOperatorType: String, CaseIterable {
    case leftShift = "<<"
    case rightShift = ">>"
    case or = "OR"
    case nor = "NOR"
    case not = "NOT"
    case and = "AND"
    case nand = "NAND"
    case xor = "XOR"
}
