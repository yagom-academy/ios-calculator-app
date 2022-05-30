//
//  Operator.swift
//  Calculator
//
//  Created by NAMU on 2022/05/19.
//

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "−"
    case divide = "÷"
    case multiply = "×"
    
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
            return substract(lhs: lhs, rhs: rhs)
        case .divide:
            return try didvide(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func substract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func didvide(lhs: Double, rhs: Double) throws -> Double {
        guard rhs != 0 else {
            throw CalculateError.infinityError
        }
        return lhs / rhs
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}
