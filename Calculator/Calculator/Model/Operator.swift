//
//  Operator.swift
//  Calculator
//
//  Created by Hamo on 2022/09/26.
//

enum Operator: Character, CaseIterable {
    case add = "+"
    case subtract = "-"
    case divide = "%"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
}
