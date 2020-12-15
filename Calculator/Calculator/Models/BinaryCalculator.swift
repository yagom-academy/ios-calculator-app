//
//  BinaryCalculator.swift
//  Calculator
//
//  Created by 김호준 on 2020/12/14.
//

import Foundation


class BinaryCalculator: BinaryCalculatorFunctions {
    private var numberStack = CalculateStack<String>()
    private var operatorStack = CalculateStack<BinaryOperatorType>()
    var lhs: Int = 0
    var rhs: Int = 0
    
    func and() -> String {
        return String((lhs & rhs), radix: 2)
    }
    
    func nand() -> String {
        return String(~(lhs & rhs), radix: 2)
    }
    
    func or() -> String {
        return String((lhs | rhs), radix: 2)
    }
    
    func nor() -> String {
        return String(~(lhs | rhs), radix: 2)
    }
    
    func xor() -> String {
        return String((lhs ^ rhs), radix: 2)
    }
    
    func not() -> String {
        return String(~(lhs), radix: 2)
    }
    
    func leftShift() -> String {
        return String((lhs << rhs), radix: 2)
    }
    
    func rightShift() -> String {
        return String((lhs >> rhs), radix: 2)
    }
    
    func add() -> String {
        return String(lhs + rhs, radix: 2)
    }
    
    func substract() -> String {
        return String(lhs - rhs, radix: 2)
    }
    
    func clear() {
        numberStack.removeAll()
        operatorStack.removeAll()
    }
    
    @discardableResult
    func calculate() -> String {
        switch operatorStack.pop() {
        case .add:
            numberStack.push(add())
        case .substract:
            numberStack.push(substract())
        case .and:
            numberStack.push(and())
        case .nand:
            numberStack.push(nand())
        case .or:
            numberStack.push(or())
        case .nor:
            numberStack.push(nor())
        case .xor:
            numberStack.push(xor())
        case .leftShift:
            numberStack.push(leftShift())
        case .rightShift:
            numberStack.push(rightShift())
        default:
            print("2진 연산자가 아닙니다!")
        }
        
        if let result = numberStack.top {
            return result
        }
        return "0"
    }
    
    func getOperator(_ input: BinaryOperatorType) {
        if operatorStack.isEmpty {
            operatorStack.push(input)
        }
        else {
            calculate()
            if input != .equals {
                operatorStack.push(input)
            }
        }
    }
    
    func getNumber(_ input: String) {
        numberStack.push(input)
    }
    
    func stringToInt() {
        if let stringRHS = numberStack.pop(), let rhs = Int(stringRHS, radix: 2) {
            self.rhs = rhs
        }
        if let stringLHS = numberStack.pop(), let lhs = Int(stringLHS, radix: 2) {
            self.lhs = lhs
        }
    }
}
