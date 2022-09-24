//
//  Operator.swift
//  Calculator
//
//  Created by baem on 2022/09/24.
//

enum Operator: Character, CaseIterable {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculates(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return 1
        case .subtract:
            return 1
        case .divide:
            return 1
        case .multiply:
            return 1
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        return lhs / rhs
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}
