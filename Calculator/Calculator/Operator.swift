//
//  Operator.swift
//  Calculator
//
//  Created by Gundy on 2022/09/22.
//

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "−"
    case divide = "÷"
    case multifly = "×"
    
    func calculate(lhs: Double, rhs: Double) throws -> Double {
        var result: Double = lhs
        switch self {
        case .add:
            result = add(lhs: lhs, rhs: rhs)
        case .subtract:
            result = subtract(lhs: lhs, rhs: rhs)
        case .divide:
            do {
                result =  try divide(lhs: lhs, rhs: rhs)
            } catch FormulaError.divideByZero {
                throw FormulaError.divideByZero
            }
        case .multifly:
            result = multifly(lhs: lhs, rhs: rhs)
        }
        return result
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func divide(lhs: Double, rhs: Double) throws -> Double {
        guard rhs != Double.zero else {
            throw FormulaError.divideByZero
        }
        return lhs / rhs
    }
    
    private func multifly(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}
