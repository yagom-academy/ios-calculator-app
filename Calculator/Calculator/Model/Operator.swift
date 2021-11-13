//
//  Operator.swift
//  Calculator
//
//  Created by 1 on 2021/11/11.
//

import Foundation

enum Operator: Character, CalculateItem, CaseIterable {
    case add = "➕"
    case subtract = "➖"
    case divide = "➗"
    case multiply = "✖️"
    
    func add(lhs: Double, rhs: Double) -> Double {
        lhs + rhs
    }
    
    func subtract(lhs: Double, rhs: Double) -> Double {
        lhs - rhs
    }
    
}
