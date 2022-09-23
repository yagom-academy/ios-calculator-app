//
//  Operator.swift
//  Created by Wonbi
//

enum Operator: Character, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case multiply = "×"
    
    var identifier: Character {
        self.rawValue
    }
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .subtract:
            return subtract(lhs: lhs, rhs: rhs)
        case .divide:
            return divide(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
}
