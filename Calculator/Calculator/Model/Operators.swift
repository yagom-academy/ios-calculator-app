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

enum operatorPrecedenceTier: Int {
    case topTier = 160
    case secondTier = 140
    case thirdTier = 120
}

struct OperatorPrecedenceTable {
    let precedence: [String:Int] = [
        "+" : operatorPrecedenceTier.thirdTier.rawValue,
        "-" : operatorPrecedenceTier.thirdTier.rawValue,
        "*" : operatorPrecedenceTier.topTier.rawValue,
        "/" : operatorPrecedenceTier.topTier.rawValue,
        "~" : operatorPrecedenceTier.topTier.rawValue,
        "&" : operatorPrecedenceTier.topTier.rawValue,
        "~&" : operatorPrecedenceTier.topTier.rawValue,
        "|" : operatorPrecedenceTier.thirdTier.rawValue,
        "~|" : operatorPrecedenceTier.thirdTier.rawValue,
        "^" : operatorPrecedenceTier.thirdTier.rawValue,
        "<<" : operatorPrecedenceTier.secondTier.rawValue,
        ">>" : operatorPrecedenceTier.secondTier.rawValue,
    ]
}
