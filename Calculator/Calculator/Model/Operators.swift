//
//  Operators.swift
//  Calculator
//
//  Created by Neph on 2021/03/25.
//

struct Operator {
    let function: (String, String) -> String
    let precedence: Int
}

enum Operators {
    static let additionForDecimal = Operator(function: DecimalCalculator.add, precedence: 140)
    static let subtractionForDecimal = Operator(function: DecimalCalculator.subtract, precedence: 140)
    static let multiplication = Operator(function: DecimalCalculator.multiply, precedence: 150)
    static let division = Operator(function: DecimalCalculator.divide, precedence: 150)
    static let additionForBinary = Operator(function: BinaryCalculator.add, precedence: 140)
    static let subtractionForBinary = Operator(function: BinaryCalculator.subtract, precedence: 140)
    static let AND = Operator(function: BinaryCalculator.AND, precedence: 150)
    static let NAND = Operator(function: BinaryCalculator.NAND, precedence: 150)
    static let OR = Operator(function: BinaryCalculator.OR, precedence: 150)
    static let XOR = Operator(function: BinaryCalculator.XOR, precedence: 150)
    static let NOR = Operator(function: BinaryCalculator.NOR, precedence: 150)
    static let shiftLeft = Operator(function: BinaryCalculator.shiftLeft, precedence: 150)
    static let shiftRight = Operator(function: BinaryCalculator.shiftRight, precedence: 150)
}
