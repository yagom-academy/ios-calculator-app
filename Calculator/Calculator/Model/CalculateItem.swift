//
//  CalculateItem.swift
//  Calculator
//
//  Created by Danny on 2/5/24.
//

import Foundation

protocol CalculateItem {
    func calculate(lhs: Double, rhs: Double) -> Double
    func add(lhs: Double, rhs: Double) -> Double
    func subtract(lhs: Double, rhs: Double) -> Double
    func divide(lhs: Double, rhs:Double) -> Double
    func multiply(lhs: Double, rhs:Double) -> Double
}
