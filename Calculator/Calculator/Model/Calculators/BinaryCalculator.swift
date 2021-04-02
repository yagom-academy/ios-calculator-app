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
        guard let userInputNumber = Int(number, radix: 2) else { throw  BinaryCalculatorError.notIntNumber }
        return userInputNumber
    }

    func convertType(inputOperator: String?) throws -> Operator {
        guard let userInputOperator = inputOperator else { throw BinaryCalculatorError.nilInputFoundWhileConvertingTypeOfOperator }
        switch userInputOperator {
        case "+":
            return Operator.addition
        case "-":
            return Operator.subtraction
        case "and":
            return Operator.andOperator
        case "nand":
            return Operator.nandOperator
        case "or":
            return Operator.orOperator
        case "nor":
            return Operator.norOperator
        case "xor":
            return Operator.xorOperator
        case "bitNot":
            return Operator.bitNotOperator
        case "bitShift":
            return Operator.bitShiftOperator
        default:
            throw BinaryCalculatorError.notAvailableOperator
        }
    }
    
    func and(operatedNumber: Int, operatingNumber: Int) -> Int {
       return Int(operatedNumber & operatingNumber, radix: 2)
    }
    
    
    
    
    
    
    
    
    
    
    
    
//    mutating func convertType(operateSign: String?, operatedNumber: Int, operatingNumber: Int) throws -> Int {
//        switch try convertType(inputOperator: operateSign) {
//        case .addition:
//            return add(operatedNumber, and: operatingNumber)
//        case .subtraction:
//            return subtract(operatedNumber, and: operatingNumber)
//        case .andOperator:
//            return add(operatedNumber, and: operatingNumber)
//        case .nandOperator:
//            return add(operatedNumber, and: operatingNumber)
//        case .orOperator:
//            return add(operatedNumber, and: operatingNumber)
//        case .norOperator:
//            return add(operatedNumber, and: operatingNumber)
//        case .xorOperator:
//            return add(operatedNumber, and: operatingNumber)
//        case .bitNotOperator:
//            return add(for: operatedNumber)
//        case .bitShiftOperator:
//            return add(for: operatedNumber, isRight: Bool)
//        default:
//            throw BinaryCalculatorError.notAvailableOperator
//        }
//    }
}

