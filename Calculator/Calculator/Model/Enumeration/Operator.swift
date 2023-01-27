//
//  Operator.swift
//  Calculator
//
//  Created by jiye Yi on 2023/01/27.
//

enum Operator: Character, CaseIterable, CalculateItemProtocol {
    case add = "+"
    case subtract = "-"
    case divide = "%"
    case multiply = "x"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        var result: Double = lhs
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .subtract:
            return subtract(lhs: lhs, rhs: rhs)
        case .divide:
            do {
                return try divide(lhs: lhs, rhs: rhs)
            } catch CalculatorError.divideError {
                print("NaN")
            } catch {
                print(error)
            }
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
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
        if rhs == Double.zero {
            throw CalculatorError.divideError
        }
        return lhs / rhs
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}

