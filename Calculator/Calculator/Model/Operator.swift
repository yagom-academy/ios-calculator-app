//
//  Operator.swift
//  Calculator
//
//  Created by Erick on 2023/05/29.
//

enum Operator: String, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(Ihs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return add(Ihs: Ihs, rhs: rhs)
        case .subtract:
            return subtract(Ihs: Ihs, rhs: rhs)
        case .divide:
            return divide(Ihs: Ihs, rhs: rhs)
        case .multiply:
            return multiply(Ihs: Ihs, rhs: rhs)
        }
    }
    
    private func add(Ihs: Double, rhs: Double) -> Double {
        return Ihs + rhs
    }
    
    private func subtract(Ihs: Double, rhs: Double) -> Double {
        return Ihs - rhs
    }
    
    private func divide(Ihs: Double, rhs: Double) -> Double {
        return Ihs / rhs
    }
    
    private func multiply(Ihs: Double, rhs: Double) -> Double {
        return Ihs * rhs
    }
}
