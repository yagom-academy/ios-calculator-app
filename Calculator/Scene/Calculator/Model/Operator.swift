//
//  Operator.swift
//  Calculator
//
//  Created by 이은찬 on 2022/05/17.
//
enum Operator: Character, CalculateItem, CaseIterable {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case devide = "/"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .subtract:
            return subtract(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        case .devide:
            return devide(lhs: lhs, rhs: rhs)
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
    
    private func devide(lhs: Double, rhs: Double) -> Double {
        return lhs / rhs
    }
}
