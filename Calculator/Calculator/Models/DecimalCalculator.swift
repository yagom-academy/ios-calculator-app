//
//  Calculator.swift
//  Calculator
//
//  Created by 김호준 on 2020/12/14.
//

import Foundation

class DecimalCalculator: DecimalCalculatorFunctions {
    private var numberStack = CalculateStack<String>()
    private var operatorStack = CalculateStack<DecimalOperatorType>()
    
    var lhs: Double = 0.0
    var rhs: Double = 0.0
    
    func add() -> String {
        return String(lhs + rhs)
    }
    
    func substract() -> String {
        return String(lhs - rhs)
    }
    
    func multiply() -> String {
        return String(lhs * rhs)
    }
    
    func divide() -> String {
        return String(lhs / rhs)
    }
    
    func clear() {
        numberStack.removeAll()
        operatorStack.removeAll()
    }
    
    @discardableResult
    func calculate() -> String {
        stringToDouble()
        
        switch operatorStack.pop() {
        case .add:
            numberStack.push(add())
        case .substract:
            numberStack.push(substract())
        case .divide:
            numberStack.push(divide())
        case .multiply:
            numberStack.push(multiply())
        default:
            print("10진수 계산이 아닙니다!")
        }
        
        if let result = numberStack.top {
            return result
        }
        return "0"
    }
    
    func getOperator(_ input: DecimalOperatorType) {
        if operatorStack.isEmpty {
            if numberStack.isEmpty {
                //숫자 입력 없이 바로 연산자가 들어온 경우
                numberStack.push("0")
            }
            operatorStack.push(input)
        }
        else {
            //연산자가 이미 있는 경우 연산 실행 후 연산자 push
            calculate()
            if input != .equals {
                operatorStack.push(input)
            }
        }
    }
    
    func getNumber(_ input: String) {
        numberStack.push(input)
    }
    
    func stringToDouble() {
        //연산을 위해 String타입의 number를 Double타입으로 변경
        if let stringRHS = numberStack.pop(), let rhs = Double(stringRHS) {
            self.rhs = rhs
        }
        if let stringLHS = numberStack.pop(), let lhs = Double(stringLHS) {
            self.lhs = lhs
        }
    }
}
