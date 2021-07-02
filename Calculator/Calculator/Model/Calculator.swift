//
//  Calculator.swift
//  Calculator
//
//  Created by Marco, Charlotte on 2021/06/24.
//

import Foundation

struct Calculator {
    private var infixDeque = Deque<Arithmetic>()
    
    private mutating func transformInfixToPostfix() -> Deque<Arithmetic> {
        var postfixDeque = Deque<Arithmetic>()
        var operatorStack = Stack<Arithmetic>()
        while let dequeueElement = infixDeque.dequeueInfront() {
            if let `operator` = dequeueElement as? Operator {
                if let top = operatorStack.top as? Operator,
                      (top == `operator`) || (top > `operator`),
                      let pop = operatorStack.pop() {
                    postfixDeque.enqueueBehind(pop)
                    infixDeque.enqueueInfront(`operator`)
                    continue
                }
                operatorStack.push(`operator`)
            } else {
                postfixDeque.enqueueBehind(dequeueElement)
            }
        }
        while let top = operatorStack.pop() {
            postfixDeque.enqueueBehind(top)
        }
        return postfixDeque
    }
}

extension Calculator {
    func getLastOperatorItemFromInfix() -> Operator? {
        guard let lastOperator = infixDeque.last as? Operator else {
            return nil
        }
        return lastOperator
    }
    mutating func removeAllInfix() {
        infixDeque.removeAll()
    }
    mutating func enqueueBehindNumberOrOperator(_ sign: Arithmetic) {
        infixDeque.enqueueBehind(sign)
    }
    mutating func dequeueBehind() {
        infixDeque.dequeueBehind()
    }
    mutating func makeCalculation() throws -> Double {
        var postfix = transformInfixToPostfix()
        var operandStack = Stack<Arithmetic>()
        while let dequeueElement = postfix.dequeueInfront() {
            if let `operator` = dequeueElement as? Operator {
                guard let rhs = operandStack.pop(),
                      let lhs = operandStack.pop() else {
                    throw StackError.underflow
                }
                guard let castedRhs = rhs as? Operand,
                      let castedLhs = lhs as? Operand else {
                    throw ArithmeticError.downCastingError
                }
                guard !(`operator`.type == .division && castedRhs.value == 0) else {
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
