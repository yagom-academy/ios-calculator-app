//
//  Calculator.swift
//  Calculator
//
//  Created by Marco, Charlotte on 2021/06/24.
//

import Foundation

struct Calculator {
    private var infixQueue = Queue<String>()
    
    private mutating func checkOperatorsInStack(_ object: String,
                                   operatorStack: inout Stack<String>,
                                   postfix: inout Queue<String>) {
        while let topOperator = operatorStack.top,
              (topOperator <=> object) || (topOperator >>> object) {
            postfix.enqueue(operatorStack.pop())
        }
        operatorStack.push(object)
    }
    
    private mutating func transformInfixToPostfix() -> Queue<String> {
        var postfixQueue = Queue<String>()
        var operatorStack = Stack<String>()
        while let dequeueElement = infixQueue.dequeue() {
            if let _ = Int(dequeueElement) {
                postfixQueue.enqueue(dequeueElement)
            } else {
                // 스택에 탑과 현재 연산자 우선순위 비교 함수
            }
        }
        while let top = operatorStack.pop() {
            postfixQueue.enqueue(top)
        }
        return postfixQueue
    }
    mutating func makeCalculation() throws -> String {
        var postfix = transformInfixToPostfix()
        
        var operandStack = Stack<String>()
        
        while let dequeueElement = postfix.dequeue() {
            if let _ = Int(dequeueElement) {
                operandStack.push(dequeueElement)
            } else {
                guard let firstOperand = operandStack.pop() else {
                    throw StackError.underflow
                }
                guard let secondOperand = operandStack.pop() else {
                    throw StackError.underflow
                }
                
                //let calculatedNumber = calculate()
                //연산결과 스택에 푸쉬
            }
        }
        guard let result = operandStack.pop() else {
            throw StackError.underflow
        }
        return result
    }
}
