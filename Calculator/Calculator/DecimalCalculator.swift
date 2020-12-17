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
    
    func checkLastOperator() -> Operator {
        guard let lastOperator = `operator`.peek() else {
            return .Nothing
        }
        return lastOperator
    }
}
