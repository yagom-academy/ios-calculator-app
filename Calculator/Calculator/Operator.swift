//
//  Operator.swift
//  Calculator
//
//  Created by 이원빈 on 2022/05/19.
//

import Foundation

enum Operator: Character, CaseIterable {
    case add = "+"
    case subtract = "−"
    case divide = "÷"
    case multiply = "×"
}

extension Operator {
    
    func calculate(lhs: Double, rhs: Double) throws -> Double {
        var result = 0.0
        switch self {
        case .add:
            result = add(lhs: lhs, rhs: rhs)
        case .subtract:
            result = substract(lhs: lhs, rhs: rhs)
        case .divide:
            guard rhs != 0 else { throw CalculatorError.dividedByZero }
            result = divide(lhs: lhs, rhs: rhs)
        case .multiply:
            result = multiply(lhs: lhs, rhs: rhs)
        }
        return result
    }
}

private extension Operator {

    func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    func substract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    func divide(lhs: Double, rhs: Double) -> Double {
        return lhs / rhs
    }
    
    func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}

extension Operator: CalculateItem {
    
}
