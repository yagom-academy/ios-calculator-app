//
//  Calculatable.swift
//  Calculator
//
//  Created by tae hoon park on 2021/06/25.
//

import Foundation

protocol Calculatable {
    func add(_ firstOperand: Double, _ secondOperand: Double) -> Double
    func substract(_ firstOperand: Double, _ secondOperand: Double) -> Double
    func multiply(_ firstOperand: Double, _ secondOperand: Double) -> Double
    func divide(_ firstOperand: Double, _ secondOperand: Double) throws -> Double
}
