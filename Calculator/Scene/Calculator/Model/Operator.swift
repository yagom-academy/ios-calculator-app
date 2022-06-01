//
//  Operator.swift
//  Calculator
//
//  Created by 본프, 수꿍 on 2022/05/17.
//
enum Operator: Character, CalculateItem, CaseIterable {
    case add = "+"
    case subtract = "−"
    case multiply = "×"
    case divide = "÷"
    
    init?(rawValue: String) {
        guard Double(rawValue) == nil else {
            return nil
        }
        self.init(rawValue: Character(rawValue))
    }
    
    func calculate(lhs: Double, rhs: Double) throws -> Double {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .subtract:
            return subtract(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        case .divide:
            return try divide(lhs: lhs, rhs: rhs)
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
    
    private func divide(lhs: Double, rhs: Double) throws -> Double {
        if rhs == 0 {
            throw CalculatorError.dividedByZero
        }
        return lhs / rhs
    }
}
