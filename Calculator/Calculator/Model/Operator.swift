//
//  Operator.swift
//  Calculator
//
//  Created by Kim Do hyung on 2021/06/22.
//

import Foundation

enum Operator: String, Computable, Comparable {
    case plus = "+"
    case minus = "-"
    case divide = "/"
    case multiply = "*"
    
    static func < (lhs: Operator, rhs: Operator) -> Bool {
        return (rhs == .divide || rhs == .multiply) && (lhs == .minus || lhs == .plus)
    }
}
