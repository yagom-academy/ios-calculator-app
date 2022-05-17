//
//  Operator.swift
//  Calculator
//
//  Created by dhoney96 on 2022/05/17.
//

import CoreGraphics

Enum Operator: CaseIterable {
    case plus
    case minus
    case division
    case multiply
    
    var symbol: String {
        switch self {
        case .plus:
            return "+"
        case .minus:
            return "-"
        case .division:
            return "/"
        case .multiply:
            return "*"
    }
}
