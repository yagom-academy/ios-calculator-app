//
//  Operator.swift
//  Calculator
//
//  Created by Red on 2022/03/18.
//

import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case multiply = "×"
    case divide = "÷"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return self.add(lhs: lhs, rhs: rhs)
        case .subtract:
            return self.subtract(lhs: lhs, rhs: rhs)
        case .divide:
            return rhs == 0 ? .nan : self.divided(lhs: lhs, rhs: rhs)
        case .multiply:
            return self.mutiply(lhs: lhs, rhs: rhs)
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func divided(lhs: Double, rhs: Double) -> Double {
        return lhs / rhs
    }
    
    private func mutiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}
