//
//  Calculable.swift
//  Calculator
//
//  Created by 잼킹 on 2021/06/23.
//

import Foundation

protocol Calculable {
    func add<T>(lhs: T, rhs: T) -> T where T: Numeric
    func subtract<T>(lhs: T, rhs: T) -> T where T: Numeric
    func multiply<T>(lhs: T, rhs: T) -> T where T: Numeric
    func divide<T>(lhs: T, rhs: T) throws -> T where T: FloatingPoint
}

extension Calculable {
    func add<T>(lhs: T, rhs: T) -> T where T: Numeric {
        lhs + rhs
    }
    
    func subtract<T>(lhs: T, rhs: T) -> T where T: Numeric {
        lhs - rhs
    }
    
    func multiply<T>(lhs: T, rhs: T) -> T where T: Numeric {
        lhs * rhs
    }
    
    func divide<T>(lhs: T, rhs: T) throws -> T where T: FloatingPoint {
        if rhs == .zero {
            throw CalculatorError.divideByZero
        }
        return lhs / rhs
    }
}
