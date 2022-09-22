//
//  Operator.swift
//  Calculator
//
//  Created by Gundy on 2022/09/22.
//

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multifly = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        var result: Double = lhs
        switch self {
        case .add:
            result = add(lhs: lhs, rhs: rhs)
        case .subtract:
            result = subtract(lhs: lhs, rhs: rhs)
        case .divide:
            do {
                result =  try divide(lhs: lhs, rhs: rhs)
            } catch {
                print(error.localizedDescription)
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
        guard rhs != 0 else {
            throw FormulaError.invalidOperand
        }
        return lhs / rhs
    }
    
    private func multifly(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}
