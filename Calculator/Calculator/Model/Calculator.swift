//
//  Calculator.swift
//  Calculator
//
//  Created by Marco, Charlotte on 2021/06/24.
//

import Foundation

struct Calculator {
    private var infixQueue = Queue<ArithmeticSign>()
    
    private mutating func compareOperators(_ operator: ArithmeticSign,
                                                _ operatorStack: inout Stack<ArithmeticSign>,
                                                _ postfix: inout Queue<ArithmeticSign>) {
        while let top = operatorStack.top,
              (top.priority == `operator`.priority) || (top.priority > `operator`.priority) {
            postfix.enqueue(operatorStack.pop())
        }
        operatorStack.push(`operator`)
    }
    private mutating func transformInfixToPostfix() -> Queue<ArithmeticSign> {
        var postfixQueue = Queue<ArithmeticSign>()
        var operatorStack = Stack<ArithmeticSign>()
        
        while !infixQueue.isEmpty {
            let dequeueElement = infixQueue.dequeue()
            switch dequeueElement {
            case .number(_):
                postfixQueue.enqueue(dequeueElement)
            default:
                compareOperators(dequeueElement, &operatorStack, &postfixQueue)
            }
        }
        while !operatorStack.isEmpty {
            let top = operatorStack.pop()
            postfixQueue.enqueue(top)
        }
        return postfixQueue
    }
}

extension Calculator {
    mutating func pushNumberOrOperator(_ sign: ArithmeticSign) {
        infixQueue.enqueue(sign)
    }
    mutating func makeCalculation() -> String {
        var postfix = transformInfixToPostfix()
        var operandStack = Stack<ArithmeticSign>()
        
        while !postfix.isEmpty {
            let dequeueElement = postfix.dequeue()
            switch dequeueElement {
            case .number(_):
                operandStack.push(dequeueElement)
            default:
                let rhs = operandStack.pop()
                let lhs = operandStack.pop()
                
                if dequeueElement == .division, rhs.extracted == 0 {
                    return "NaN"
                }
                
                let computedNumber = dequeueElement.computeNumber(lhs.extracted, rhs.extracted)
                let wrappingNumber = ArithmeticSign.number(computedNumber)
                operandStack.push(wrappingNumber)
            }
        }
        let resultDouble = operandStack.pop().extracted
        return String(resultDouble)
    }
}

