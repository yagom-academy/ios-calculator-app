//
//  OperatorType.swift
//  Calculator
//
//  Created by 김호준 on 2020/12/14.
//

import Foundation

enum DecimalOperatorType: String, CaseIterable {
    case add = "+"
    case substract = "-"
    case divide = "/"
    case multiply = "*"
    case equals = "="
}


enum BinaryOperatorType: String, CaseIterable {
    case add = "+"
    case substract = "-"
    case and = "AND"
    case nand = "NAND"
    case or = "OR"
    case nor = "NOR"
    case xor = "XOR"
    case leftShift = "<<"
    case rightShift = ">>"
    case equals = "="
}
