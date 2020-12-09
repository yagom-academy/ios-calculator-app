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
    func add(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData
    func subtract(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData
    func multiply(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData
    func clear()
}

protocol DecimalCalculable: BasicCalculable {
    func getOperatorData(_ item: String) throws -> DecimalData
    func divide(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData
}

protocol BinaryCalculable: BasicCalculable {
    func getOperatorData(_ item: String) throws -> BinaryData
    func and(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData
    func or(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData
    func xor(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData
    func nor(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData
    func not(_ item: CalculatorData) throws -> CalculatorData
    func nand(firstItem: CalculatorData, secondItem: CalculatorData) throws -> CalculatorData
    func leftShift(_ item: CalculatorData) throws -> CalculatorData
    func rightShift(_ item: CalculatorData) throws -> CalculatorData
}
