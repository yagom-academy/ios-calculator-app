//
//  Calculator.swift
//  Calculator
//
//  Created by 이예원 on 2021/06/24.
//

import Foundation

struct Calculator {
    private var infixQueue = Queue<String>()
    private var postfixQueue = Queue<String>()
    
    mutating func transformInfixToPostfix() {
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
    }
    mutating func makeCalculation() -> String {
        var operandStack = Stack<String>()
        
        while let dequeueElement = postfixQueue.dequeue() {
            if let _ = Int(dequeueElement) {
                operandStack.push(dequeueElement)
            } else {
                let firstPop = operandStack.pop()
                let secondPop = operandStack.pop()
                
                //let calculatedNumber = calculate()
                //연산결과 스택에 푸쉬
            }
        }
        return operandStack.pop()
    }
}
