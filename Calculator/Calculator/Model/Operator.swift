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
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .substract:
            return substract(lhs: lhs, rhs: rhs)
        case .divide:
            return divide(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        }
    }
    
    func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    func substract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    func divide(lhs: Double, rhs: Double) -> Double {
        return lhs / rhs
    }
    
    func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}


