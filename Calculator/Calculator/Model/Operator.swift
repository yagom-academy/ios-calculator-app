//
//  Operator.swift
//  Calculator
//
//  Created by jin on 9/21/22.
//

enum Operator: Character, CaseIterable, CalculateItem {
    
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case multiply = "×"
    
    public func calculate(lhs: Double, rhs: Double) -> Double {
        
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .subtract:
            return subtract(lhs: lhs, rhs: rhs)
        case .divide:
            if rhs == 0 {
                fatalError("0으로 나눌 수 없습니다!")
            }
            return divide(lhs: lhs, rhs: rhs)
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
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        return lhs / rhs
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}
