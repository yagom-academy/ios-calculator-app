//
//  Operator.swift
//  Calculator
//
//  Created by SeoDongyeon on 2022/03/28.
//

import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case multiply = "×"
    
    private func add(_ lhs: Double, by rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func subtract(_ lhs: Double, by rhs: Double) -> Double {
        return lhs - rhs
    }
}
