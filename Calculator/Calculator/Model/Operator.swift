//
//  Operator.swift
//  Calculator
//
//  Created by DuDu on 2022/03/18.
//

enum CalculateError: Error {
    case divideByZero
    case invalidFormula
}

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case multiply = "×"
    
    func calculate(lhs: Double, rhs: Double) throws -> Double {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .subtract:
            return subtract(lhs: lhs, rhs: rhs)
        case .divide:
            return try divide(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        lhs + rhs
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        lhs - rhs
    }
    
    private func divide(lhs: Double, rhs: Double) throws -> Double {
        if rhs == 0 {
            throw CalculateError.divideByZero
        } else {
            return lhs / rhs
        }
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        lhs * rhs
    }
}


