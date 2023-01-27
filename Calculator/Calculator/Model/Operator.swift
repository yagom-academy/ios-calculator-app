//
//  Operator.swift
//  Calculator
//
//  Created by Jinah Park on 2023/01/27.
//

import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case devide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
    
    private func devide(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
    
}
