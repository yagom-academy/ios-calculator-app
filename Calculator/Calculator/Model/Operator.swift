//
//  Operator.swift
//  Calculator
//
//  Created by 김태현 on 2022/03/18.
//

enum Operator: Character, CalculateItem, CaseIterable {
    case add = "+"
    case subtract = "-"
    case devide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) throws -> Double {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .subtract:
            return subtract(lhs: lhs, rhs: rhs)
        case .devide:
            return try devide(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func devide(lhs: Double, rhs: Double) throws -> Double {
        if rhs == 0 {
            throw CalculatorError.devidedByZero
        }
        return lhs / rhs
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}
