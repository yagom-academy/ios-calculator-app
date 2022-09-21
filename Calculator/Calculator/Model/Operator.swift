//
//  Operator.swift
//  Calculator
//
//  Created by jin on 9/21/22.
//

enum Operator: Character, CaseIterable, CalculateItem {
    
    public case add = "+"
    public case subtract = "-"
    public case divide = "÷"
    public case multiply = "×"
    
    public calculate(lhs: Double, rhs: Double) -> Double {
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
    
    private add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private divide(lhs: Double, rhs: Double) -> Double {
        return lhs / rhs
    }
    
    private multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}
