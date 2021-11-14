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
    
    func divide(lhs: Double, rhs: Double) -> Double {
        if rhs == 0.0 {
            return Double.nan
        } else {
            return lhs / rhs
        }
    }
    
    func multiply(lhs: Double, rhs: Double) -> Double {
        lhs * rhs
    }
    
}

