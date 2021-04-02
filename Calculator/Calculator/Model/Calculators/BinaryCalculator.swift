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
    
    func convertType(inputNumber: String?) -> Int {
        guard let number = inputNumber else { return 0 }
        guard let userInputNumber = Int8(number, radix: 2) else { return 0 }
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
// 잊지 말 것: 메서드 구현 후 바로 유닛테스트.
// 과연 그것 때문일까요
// 프로토콜을 채택하려면 어떻게 해야한다? conform 못한다는게 무슨 의미일까요?
