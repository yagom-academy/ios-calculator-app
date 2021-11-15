//
//  Operator.swift
//  Calculator
//
//  Created by yeha on 2021/11/15.
//

import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(_ lhs: Double, _ rhs: Double) -> Double {
        return 1.1
    }
}
