//
//  Operator.swift
//  Calculator
//
//  Created by Harry,Gaot on 2023/02/06.


import Foundation

enum Operator: Character, CaseIterable {
    case add = "+"
    case subtract = "−"
    case divide = "÷"
    case multiply = "×"
    

    func calculate(lhs: Double, rhs: Double) -> Double {

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
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }

    private func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        if rhs == 0 {
            return Double.nan
        }
        
        return lhs / rhs
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}


