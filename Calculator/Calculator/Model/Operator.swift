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
    
    func calculate(lhs: Double, rhs: Double) throws -> Double {
        var result: Double
        switch self {
        case .add:
            result = add(lhs: lhs, rhs: rhs)
        case .subtract:
            result = subtract(lhs: lhs, rhs: rhs)
        case .multiply:
            result = multiply(lhs: lhs, rhs: rhs)
        case .divide:
            do {
                result = try divide(lhs: lhs, rhs: rhs)
            } catch {
                throw OccuredError.tryDivideZero
            }
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
    
    func divide(lhs: Double, rhs: Double) throws -> Double {
        if rhs == 0 {
            throw OccuredError.tryDivideZero
        }
        let divideResult: Double = lhs / rhs
        return divideResult
    }
    
    init(rawValue: String) {
        switch rawValue {
        case "+":
            self = .add
        case "-":
            self = .subtract
        case "*":
            self = .multiply
        case "/":
            self = .divide
        default:
            self.init(rawValue: ".")
            return
        }
    }
}
