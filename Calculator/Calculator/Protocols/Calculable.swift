//
//  Calculable.swift
//  Calculator
//
//  Created by Wonhee on 2020/12/08.
//

import Foundation

protocol BasicCalculable {
    func calculate(_ items: [String]) throws -> CalculatorData
    func putFormula(_ items: [String]) throws -> [CalculatorData]
    func add(firstItem: CalculatorData, secondItem: CalculatorData) throws
    func subtract(firstItem: CalculatorData, secondItem: CalculatorData) throws
    func multiply(firstItem: CalculatorData, secondItem: CalculatorData) throws
    func clear()
}

protocol DecimalCalculable: BasicCalculable {
    func getOperatorData(_ item: String) throws -> DecimalData
    func divide(firstItem: CalculatorData, secondItem: CalculatorData) throws
}

protocol BinaryCalculable: BasicCalculable {
    func getOperatorType(_ item: String) throws -> BinaryOperatorType
    func and(firstItem: CalculatorData, secondItem: CalculatorData) -> CalculatorData
    func or(firstItem: CalculatorData, secondItem: CalculatorData) -> CalculatorData
    func xor(firstItem: CalculatorData, secondItem: CalculatorData) -> CalculatorData
    func nor(firstItem: CalculatorData, secondItem: CalculatorData) -> CalculatorData
    func not(firstItem: CalculatorData, secondItem: CalculatorData) -> CalculatorData
    func nand(firstItem: CalculatorData, secondItem: CalculatorData) -> CalculatorData
    func leftShift(_ item: CalculatorData) -> CalculatorData
    func rightShift(_ item: CalculatorData) -> CalculatorData
}
