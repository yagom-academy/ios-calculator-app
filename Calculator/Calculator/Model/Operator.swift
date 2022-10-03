//  Operator.swift
//  Calculator
//  Created by LJ on 2022/09/20.

import Foundation

//enum Operator: Character, CaseIterable {
enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        var result: Double
        switch self {
        case .add:
            result = add(lhs: lhs, rhs: rhs)
        case .subtract:
            result = subtract(lhs: lhs, rhs: rhs)
        case .multiply:
            result = multiply(lhs: lhs, rhs: rhs)
        case .divide:
            result = divide(lhs: lhs, rhs: rhs)
        }
        return result
    }
    
    func add(lhs: Double, rhs: Double) -> Double {
        let addResult: Double = lhs + rhs
        return addResult
    }
    
    func subtract(lhs: Double, rhs: Double) -> Double {
        let subtractResult: Double = lhs - rhs
        return subtractResult
    }
    
    func multiply(lhs: Double, rhs: Double) -> Double {
        let multiplyResult: Double = lhs * rhs
        return multiplyResult
    }
    
    func divide(lhs: Double, rhs: Double) -> Double {
        let divideResult: Double = lhs / rhs
        return divideResult
    }
}
