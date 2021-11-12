//
//  Operator.swift
//  Calculator
//
//  Created by Jun Bang on 2021/11/12.
//

import Foundation

enum Operator: Character, CaseIterable {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return lhs + rhs
        case .subtract:
            return lhs - rhs
        case .divide:
            return lhs / rhs
        }
    }
}
