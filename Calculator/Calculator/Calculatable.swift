//
//  Calculatable.swift
//  Calculator
//
//  Created by tae hoon park on 2021/06/25.
//

import Foundation

protocol Calculatable {
    func add(_ firstNumber: Double, _ secondNumber: Double) -> Double
    func substract(_ firstNumber: Double, _ secondNumber: Double) -> Double
    func multiply(_ firstNumber: Double, _ secondNumber: Double) -> Double
    func divide(_ firstNumber: Double, _ secondNumber: Double) throws -> Double
}
