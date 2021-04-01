//
//  Operators.swift
//  Calculator
//
//  Created by 천수현 on 2021/03/25.
//

struct Operator {
    let function: Any
    let precedence: Int
}

enum Operators {
    static let additionForDecimal = Operator(function: DecimalCalculator.add, precedence: 140)
    static let subtractionForDecimal = Operator(function: DecimalCalculator.subtract, precedence: 140)
    static let additionForBinary = Operator(function: BinaryCalculator.add, precedence: 140)
    static let subtractionForBinary = Operator(function: BinaryCalculator.subtract, precedence: 140)
    static let multiplication = Operator(function: DecimalCalculator.shared.multiply, precedence: 150)
    static let division = Operator(function: DecimalCalculator.shared.divide, precedence: 150)
    static let AND = Operator(function: BinaryCalculator.shared.AND, precedence: 150)
    static let NAND = Operator(function: BinaryCalculator.shared.NAND, precedence: 150)
    static let OR = Operator(function: BinaryCalculator.shared.OR, precedence: 150)
    static let XOR = Operator(function: BinaryCalculator.shared.XOR, precedence: 150)
    static let NOR = Operator(function: BinaryCalculator.shared.NOR, precedence: 150)
    static let NOT = Operator(function: BinaryCalculator.shared.NOT, precedence: 150)
}
