//
//  CalculateItem.swift
//  Calculator
//
//  Created by 이시원 on 2022/03/18.
//

import Foundation

protocol CalculateItem {
    
}

extension Double: CalculateItem {
    
}

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case multiply = "×"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return self.add(lhs: lhs, rhs: rhs)
        case .subtract:
            return self.subtract(lhs: lhs, rhs: rhs)
        case .divide:
            return self.divide(lhs: lhs, rhs: lhs)
        case .multiply:
            return self.multiply(lhs: lhs, rhs: rhs)
        }
    }
        
    private func add(lhs: Double, rhs: Double) -> Double { lhs + rhs }
    
    private func subtract(lhs: Double, rhs: Double) -> Double { lhs - rhs }
    
    private func divide(lhs: Double, rhs: Double) -> Double { lhs / rhs }
    
    private func multiply(lhs: Double, rhs: Double) -> Double { lhs * rhs }
    
}
