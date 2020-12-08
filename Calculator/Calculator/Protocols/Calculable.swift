//
//  Calculable.swift
//  Calculator
//
//  Created by Wonhee on 2020/12/08.
//

import Foundation

protocol BasicCalculable {
    func add(firstItem: CalculatorData, secondItem: CalculatorData) -> CalculatorData
    func subtract(firstItem: CalculatorData, secondItem: CalculatorData) -> CalculatorData
    func multiply(firstItem: CalculatorData, secondItem: CalculatorData) -> CalculatorData
    func clear()
}

protocol DecimalCalculable: BasicCalculable {
    func divide(firstItem: CalculatorData, secondItem: CalculatorData) -> CalculatorData
}

protocol BinaryCalculable: BasicCalculable {
    func and(firstItem: CalculatorData, secondItem: CalculatorData) -> CalculatorData
    func or(firstItem: CalculatorData, secondItem: CalculatorData) -> CalculatorData
    func xor(firstItem: CalculatorData, secondItem: CalculatorData) -> CalculatorData
    func nor(firstItem: CalculatorData, secondItem: CalculatorData) -> CalculatorData
    func not(firstItem: CalculatorData, secondItem: CalculatorData) -> CalculatorData
    func nand(firstItem: CalculatorData, secondItem: CalculatorData) -> CalculatorData
    func leftShift(_ item: CalculatorData) -> CalculatorData
    func rightShift(_ item: CalculatorData) -> CalculatorData
}
