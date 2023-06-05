//
//  Operator.swift
//  Calculator
//
//  Created by Dasan on 2023/06/02.
//

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "−"
    case divide = "÷"
    case multiply = "×"
    
    func calculate(lhs: Double, rhs: Double) throws -> Double {
        switch self {
        case .add:
            return self.add(lhs: lhs, rhs: rhs)
        case .subtract:
            return self.subtract(lhs: lhs, rhs: rhs)
        case .divide:
            return try self.divide(lhs: lhs, rhs: rhs)
        case .multiply:
            return self.multiply(lhs: lhs, rhs: rhs)
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        let result = lhs + rhs
        return result
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        let result = lhs - rhs
        return result
    }
    
    private func divide(lhs: Double, rhs: Double) throws -> Double {
        guard rhs != 0.0 else {
            throw CalculatorError.NotDivisibleByZero
        }
        
        let result = lhs / rhs
        return result
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        let result = lhs * rhs
        return result
    }
}
