//
//  Calculator.swift
//  Calculator
//
//  Created by 잼킹 on 2021/06/23.
//

import Foundation

class Calculator {
    private var stack = Stack<String>()
    private var infix = Array<String>()
    private var postfix = Array<String>()
}

extension Calculator: Calculable {
    func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
    
    func divide(lhs: Double, rhs: Double) throws -> Double {
        if rhs == 0.0 {
            throw CalculatorError.divideByZero
        }
        return lhs / rhs
    }
}

extension Calculator {
    func putIntoInfix(of input: String) {
        infix.append(input)
    }
    
    func changeToPosfix() {
        for element in infix {
            if Double(element) != nil {
                postfix.append(element)
            } else {
                while true {
                    if stack.isEmpty || Operator.obtainOperator(from: element).isHigherPriority(than: Operator.obtainOperator(from: stack.peek() ?? "+")) {
                        stack.push(element: element)
                        break
                    } else {
                        postfix.append(stack.pop() ?? "+")
                    }
                }
            }
        }
    }
    
    func evaluate() {
        
    }
}
