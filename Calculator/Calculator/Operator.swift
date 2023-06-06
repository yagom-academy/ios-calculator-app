//
//  Operator.swift
//  Calculator
//
//  Created by redmango1446 on 2023/06/05.
//

enum Operator: Character, CaseIterable {
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case multiply = "×"
    
    func calculate(lhs: Double, rhs:Double) -> Double {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .subtract:
            return subtract(lhs: lhs, rhs: rhs)
        case .divide:
            return divide(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        }
    }
    
    func add(lhs: Double, rhs:Double) -> Double {
        return lhs + rhs
    }
    
    func subtract(lhs: Double, rhs:Double) -> Double {
        return lhs - rhs
    }
    
    func divide(lhs: Double, rhs:Double) -> Double {
        return lhs / rhs // 0나누기 처리 해야함
    }
    
    func multiply(lhs: Double, rhs:Double) -> Double {
        return lhs * rhs
    }
}
