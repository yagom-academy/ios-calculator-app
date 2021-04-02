//
//  BinaryCalculator.swift
//  Calculator
//
//  Created by ysp on 2021/03/30.
//

import Foundation

struct BinaryCalculator: Subtractable, Addable, TypeConvertible {
    typealias T = Int
    var stack = Stack<Int>()
    var userInputNumber: Int = 0
    var userInputOperator: Operator = .addition
    
    func convertType(inputNumber: String?) throws -> Int {
        guard let number = inputNumber else {
            throw BinaryCalculatorError.nilInputFoundWhileConvertingTypeOfNumber }
        guard let userInputNumber = Int(number, radix: 2) else { throw BinaryCalculatorError.nilInputFoundWhileConvertingTypeOfNumber }
        return userInputNumber
    }

    func convertType(inputOperator: String?) throws -> Operator {
        guard let userInputOperator = inputOperator else { throw DecimalCalculatorError.nilInputFoundWhileConvertingTypeOfOperator }
        switch userInputOperator {
        case "+":
            return Operator.addition
        case "-":
            return Operator.subtraction
        case "*":
            return Operator.multiplication
        case "/":
            return Operator.division
        default:
            throw DecimalCalculatorError.notAvailableOperator
        }
    }
}
