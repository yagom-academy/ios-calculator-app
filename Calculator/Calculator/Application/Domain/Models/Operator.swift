//
//  Operator.swift
//  Calculator
//
//  Created by Gordon Choi on 2022/05/19.
//

enum Operator: Character, CalculateItem, CaseIterable {
    case add = "+"
    case subtract = "–"
    case divide = "÷"
    case multiply = "×"
    
    func calculate(lhs: Double, rhs: Double) throws -> Double {
        switch self {
        case .add:
            let value = add(lhs: lhs, rhs: rhs)
            return value
        case .subtract:
            let value = subtract(lhs: lhs, rhs: rhs)
            return value
        case .divide:
            let value = try divide(lhs: lhs, rhs: rhs)
            return value
        case .multiply:
            let value = multiply(lhs: lhs, rhs: rhs)
            return value
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func divide(lhs: Double, rhs: Double) throws -> Double {
        guard rhs != 0 else {
            throw CalculatorError.dividedByZero
        }
        return lhs / rhs
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}
