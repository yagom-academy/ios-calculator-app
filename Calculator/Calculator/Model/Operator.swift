//
//  Operator.swift
//  Calculator
//
//  Created by mireu on 2023/10/06.
//

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "➕"
    case substract = "➖"
    case divide = "➗"
    case multiply = "✖️"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        return 0
    }
    func add(lhs: Double, rhs: Double) -> Double {
        return 0
    }
    func substract(lhs: Double, rhs: Double) -> Double {
        return 0
    }
    func divide(lhs: Double, rhs: Double) -> Double {
        return 0
    }
    func multiply(lhs: Double, rhs: Double) -> Double {
        return 0
    }
}


