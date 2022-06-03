//
//  Operator.swift
//  Calculator
//
//  Created by 유한석 on 2022/05/18.
//
enum Operator: Character, CaseIterable, CalculatorItem {
    case add = "+"
    case substract = "−"
    case divide = "÷"
    case multiply = "×"
    
    func calculate(lhs: Double, rhs: Double) throws -> Double {
        switch self {
        case .add:
            return self.add(lhs: lhs, rhs: rhs)
        case .substract:
            return self.substract(lhs: lhs, rhs: rhs)
        case .divide:
            return try self.divide(lhs: lhs, rhs: rhs)
        case .multiply:
            return self.multiply(lhs: lhs, rhs: rhs)
        }
    }
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    private func substract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    private func divide(lhs: Double, rhs: Double) throws -> Double {
        if rhs == 0.0 {
            throw CalculatorError.dividedByZero
        } else {
            return lhs / rhs
        }
    }
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}
