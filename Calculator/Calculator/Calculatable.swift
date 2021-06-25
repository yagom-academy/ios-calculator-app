//
//  Calculatable.swift
//  Calculator
//
//  Created by tae hoon park on 2021/06/25.
//

import Foundation

protocol Calculatable {
    func add(first number: Double, second number: Double) -> Double
    func substract(first number: Double, second number: Double) -> Double
    func multiply(first number: Double, second number: Double) -> Double
    func divide(first number: Double, second number: Double) -> Double
}
