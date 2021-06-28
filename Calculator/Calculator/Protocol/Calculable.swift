//
//  Calculable.swift
//  Calculator
//
//  Created by 잼킹 on 2021/06/23.
//

import Foundation

protocol Calculable {
    func add(lhs: Double, rhs: Double) -> Double
    func subtract(lhs: Double, rhs: Double) -> Double
    func multiply(lhs: Double, rhs: Double) -> Double
    func divide(lhs: Double, rhs: Double) throws -> Double
}

extension Calculable {
    func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
    
    func divide(lhs: Double, rhs: Double) throws -> Double {
        if rhs == 0.0 {
            throw CalculatorError.divideByZero
        }
        return lhs / rhs
    }
}
