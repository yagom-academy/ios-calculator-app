//
//  DecimalCalculator.swift
//  Calculator
//
//  Created by Jinho Choi on 2020/12/15.
//

import Foundation

class DecimalCalculator {
    var operand = Stack<String>()
    var `operator` = Stack<Operator>()
    var priority = Stack<Int>()
    
    func printStack() {
        print("피연산자 배열: \(operand.stack)")
        print("연산자 배열: \(`operator`.stack)")
        print("우선순위 배열: \(priority.stack)")
    }
    
    func resetStack() {
        operand.stack = []
        `operator`.stack = []
        priority.stack = []
    }
    
    func add(oldOperand: Double, newOperand: Double) -> Double {
        let result = oldOperand + newOperand
        return result
    }
    
    func subtract(oldOperand: Double, newOperand: Double) -> Double {
        let result = oldOperand - newOperand
        return result
    }
    
    func multiply(oldOperand: Double, newOperand: Double) -> Double {
        let result = oldOperand * newOperand
        return result
    }
    
    func divide(oldOperand: Double, newOperand: Double) -> Double {
        guard newOperand != 0 else {
            return Double.infinity
        }
        let result = oldOperand / newOperand
        return result
    }
    
    func pushOperandOnStack(_ operand: String) {
        self.operand.push(value: operand)
    }
    
    func pushOperatorOnStack(_ operator: Operator) {
        self.`operator`.push(value: `operator`)
    }
    
    func popOperatorOnStack(_ operator: Operator) {
        self.`operator`.pop()
    }
    
    func convertDoubleToString(result: Double) -> String {
        return String(result)
    }
    
    func checkLastOperator() -> Operator {
        guard let lastOperator = `operator`.peek() else {
            return .nothing
        }
        return lastOperator
    }
    
    func isCalculable() -> Bool {
        if operand.stack.count >= 2 {
            return true
        } else {
            return false
        }
    }
    
    func arithmetic(type: Operator) -> Double {
        var result: Double
        guard isCalculable() else {
            print("계산할 수 없는 상태입니다. 스택을 확인해보세요")
            printStack()
            return .nan
        }
        guard let newOperand = Double(operand.pop()),
              let oldOperand = Double(operand.pop()) else {
            return .nan
        }
        
        switch type {
        case .addition:
            result = add(oldOperand: oldOperand, newOperand: newOperand)
        case .subtraction:
            result = subtract(oldOperand: oldOperand, newOperand: newOperand)
        case .multiplication:
            result = multiply(oldOperand: oldOperand, newOperand: newOperand)
        case .division:
            result = divide(oldOperand: oldOperand, newOperand: newOperand)
        case .nothing:
            print("연산자가 존재하지 않습니다.")
            return .nan
        @unknown default:
            print("+,-,*,/ 가 아닌 다른 기호가 들어왔습니다.")
            return .nan
        }
        return result
    }
    
    func checkPreviousOperator() -> Operator {
        guard !`operator`.isEmpty() else {
            return .nothing
        }
        guard let lastOperator = `operator`.peek() else {
            return .nothing
        }
        return lastOperator
    }
}
