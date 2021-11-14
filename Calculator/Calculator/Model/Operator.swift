//
//  Operator.swift
//  Calculator
//
//  Created by JeongTaek Han on 2021/11/14.
//

import Foundation

enum Operator: Character {
    case add = "+"
    case subtract = "-"
    case divide = "*"
    case multiply = "/"
    
    func calculate(lhs: Double, rhs: Double) throws -> Double {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .subtract:
            return subtract(lhs: lhs, rhs: rhs)
        case .divide:
            return try divide(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        let result = Decimal(lhs) + Decimal(rhs)
        return result.doubleValue
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        let result = Decimal(lhs) - Decimal(rhs)
        return result.doubleValue
    }
    
    private func divide(lhs: Double, rhs: Double) throws -> Double {
        if rhs == 0.0 { throw CalculateError.notANumber }
        let result = Decimal(lhs) / Decimal(rhs)
        return result.doubleValue
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        let result = Decimal(lhs) * Decimal(rhs)
        return result.doubleValue
    }
    
    enum CalculateError: Error {
        case notANumber
    }
}

extension Operator: CaseIterable { }

extension Operator: CalculateItem { }
