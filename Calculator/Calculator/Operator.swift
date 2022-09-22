//
//  Operator.swift
//  Calculator
//
//  Created by Gundy on 2022/09/22.
//

enum Operator: Character, CaseIterable, CalculateItem {
    case add
    case subtract
    case divide
    case multifly
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            add(lhs: lhs, rhs: rhs)
        case .subtract:
            subtract(lhs: lhs, rhs: rhs)
        case .divide:
            divide(lhs: lhs, rhs: rhs)
        case .multifly:
            multifly(lhs: lhs, rhs: rhs)
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
            throw Error
        }
        return lhs / rhs
    }
    
    private func multifly(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}
