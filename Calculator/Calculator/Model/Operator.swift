//
//  Operator.swift
//  Calculator
//
//  Created by Sunwoo on 2021/11/16.
//

import Foundation

enum Operator: Character, CaseIterable, CalculatorItem {
    case add = "+"
    case subtract = "₋"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        var calculateResult: Double
        switch self {
        case .add:
            calculateResult = add(lhs: lhs, rhs: rhs)
        case .subtract:
            calculateResult = subtract(lhs: lhs, rhs: rhs)
        case .divide:
            calculateResult = divide(lhs: lhs, rhs: rhs)
        case .multiply:
            calculateResult = multiply(lhs: lhs, rhs: rhs)
        }
        return calculateResult
    }
    private func add(lhs: Double, rhs: Double) -> Double {
        return Double()
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return Double()
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        return Double()
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return Double()
    }
}
