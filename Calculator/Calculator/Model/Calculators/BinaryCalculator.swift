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
    
    func andOperate(with operatedNumber: Int, and operatingNumber: Int) -> Int {
       return init(operatedNumber & operatingNumber, radix: 2)
    }
    
    
    
    
    
    
    // 한숨 노노
    // 머선 한숨29
    
    
    mutating func calculate(operateSign: String?, operatedNumber: Int, operatingNumber: Int) throws -> Int {
        switch try convertType(inputOperator: operateSign) {
        case .addition:
            return add(operatedNumber, and: operatingNumber)
        case .subtraction:
            return subtract(operatedNumber, and: operatingNumber)
        case .andOperator:
            return andOperate(with: operatedNumber, and: operatingNumber)
        case .nandOperator:
            return nandOperate(with: operatedNumber, and: operatingNumber)
        case .orOperator:
            return orOperate(with: operatedNumber, and: operatingNumber)
        case .norOperator:
            return norOperate(with: operatedNumber, and: operatingNumber)
        case .xorOperator:
            return xorOperate(with: operatedNumber, and: operatingNumber)
        case .bitNotOperator:
            return bitNotOperate(for: operatedNumber)
        case .bitShiftOperator:
            return bitShiftOperate(for: operatedNumber, isRight: Bool)
        default:
            throw BinaryCalculatorError.notAvailableOperator
        }
    }
    
    mutating func executeOperate(of inputNumber: String?) {
        do {
            try stack.push(convertType(inputNumber: inputNumber))
            for _ in 1...10 {
                stack.push(try calculate(operateSign: readLine(), operatedNumber: stack.pop()!, operatingNumber: convertType(inputNumber: readLine())))
            }
        } catch {
            print(error)
        }
    }
    
    func showTopOfStack() -> Int {
        if stack.top! / 0b1000000000 >= 1 {
            return stack.top! % 0b1000000000 // >>? 다시한번 생각. 나누면 뭐가나와요?
        } else {
            return stack.top!
        }
    }
}

