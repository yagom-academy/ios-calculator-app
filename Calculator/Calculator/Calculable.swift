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
