//
//  Operator.swift
//  Calculator
//
//  Created by Sunwoo on 2021/11/16.
//

import Foundation

enum Operator: Character, CaseIterable, CalculatorItem {
    case add = "+"
    case subtract = "−"
    case divide = "÷"
    case multiply = "×"
    
    func calculate(lhs: Double, rhs: Double) throws -> Double {
        var calculateResult: Double
        
        switch self {
        case .add:
            calculateResult = add(lhs: lhs, rhs: rhs)
        case .subtract:
            calculateResult = subtract(lhs: lhs, rhs: rhs)
        case .divide:
            calculateResult = try divide(lhs: lhs, rhs: rhs)
        case .multiply:
            calculateResult = multiply(lhs: lhs, rhs: rhs)
        }
        
        return calculateResult
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func divide(lhs: Double, rhs: Double) throws -> Double {
        if rhs == .zero {
            throw OperandsError.dividedByZero
        }
        return lhs / rhs
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}
