//
//  Calculator.swift
//  Calculator
//
//  Created by Marco, Charlotte on 2021/06/24.
//

import Foundation

struct Calculator {
    private var infixQueue = Queue<Arithmetic>()
    
    private mutating func transformInfixToPostfix() -> Queue<Arithmetic> {
        var postfixQueue = Queue<Arithmetic>()
        var operatorStack = Stack<Arithmetic>()
        while let dequeueElement = infixQueue.dequeue() {
            if let `operator` = dequeueElement as? Operator {
                if let top = operatorStack.top as? Operator,
                      (top == `operator`) || (top > `operator`),
                      let pop = operatorStack.pop() {
                    postfixQueue.enqueue(pop)
                    infixQueue.enqueueInFront(`operator`)
                    continue
                }
                operatorStack.push(`operator`)
            } else {
                postfixQueue.enqueue(dequeueElement)
            }
        }
        while let top = operatorStack.pop() {
            postfixQueue.enqueue(top)
        }
        return postfixQueue
    }
}

extension Calculator {
    mutating func pushNumberOrOperator(_ sign: Arithmetic) {
        infixQueue.enqueue(sign)
    }
    mutating func makeCalculation() throws -> Double {
        var postfix = transformInfixToPostfix()
        var operandStack = Stack<Arithmetic>()
        
        while let dequeueElement = postfix.dequeue() {
            if let `operator` = dequeueElement as? Operator {
                guard let rhs = operandStack.pop(),
                      let lhs = operandStack.pop() else {
                    throw StackError.underflow
                }
                guard let castedRhs = rhs as? Operand,
                      let castedLhs = lhs as? Operand else {
                    throw ArithmeticError.downCastingError
                }
                
                if `operator`.type == .division, castedRhs.value == 0 {
                    throw CalculatorError.zeroDivisor
                }

                let computedNumber = `operator`.computeNumber(castedLhs.value, castedRhs.value)
                
                let wrappingNumber = Operand(value: computedNumber)
                operandStack.push(wrappingNumber)
            } else {
                operandStack.push(dequeueElement)
            }
        }
        guard let upcastingResult = operandStack.pop()  else {
            throw StackError.underflow
        }
        guard let result = upcastingResult as? Operand else {
            throw ArithmeticError.downCastingError
        }
        return result.value
    }
}
