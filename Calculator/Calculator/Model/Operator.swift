//
//  Operator.swift.swift
//  Calculator
//
//  Created by Seul Mac on 2021/11/09.
//

import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "−"
    case multiply = "×"
    case divide = "÷"
    
    init?(sign: Character) {
        self.init(rawValue: sign)
    }
    
    var operatorSign: Character {
            switch self {
            case .add:
                return "+"
            case .subtract:
                return "−"
            case .multiply:
                return "×"
            case .divide:
                return "÷"
            }
        }
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .subtract:
            return subtract(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        case .divide:
            return divide(lhs: lhs, rhs: rhs)
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        return lhs / rhs
    }
}
