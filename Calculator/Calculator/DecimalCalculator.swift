//
//  DecimalCalculator.swift
//  Calculator
//
//  Created by 임성민 on 2020/12/08.
//

import Foundation

enum DecimalCalculatorError: Error {
    case emptyStack
    case lackNumber
    case stackItemError
}

class DecimalCalculator: BasicCalculable, DecimalCalculable {
    
    private var operatorStack: Stack<String> = Stack<String>()
    private var numberStack: Stack<Double> = Stack<Double>()
    
    func pushNumber(_ number: Double) {
        numberStack.push(number)
    }
    
    /// - TODO: 연산자 2개이상이 연속으로 들어올경우에 대한 예외 처리.
    func add() {
        guard numberStack.size > 0 else {
            return
        }
        
        while operatorStack.top != nil {
            let `operator` = operatorStack.pop()
            guard let number1 = numberStack.pop(), let number2 = numberStack.pop() else {
                /// - TODO: numberStack size가 2보다 작을 경우에 대한 예외처리.
                return
            }
            
            switch `operator` {
            case "+":
                numberStack.push(number2 + number1)
            case "-":
                numberStack.push(number2 - number1)
            case "*":
                numberStack.push(number2 * number1)
            case "/":
                numberStack.push(number2 / number1)
            default:
                /// - TODO: 잘못된 연산자가 스택에 있을 경우에 대한 예외처리.
                print("잘못된 연산자")
            }
        }
        
        operatorStack.push("+")
    }
    
    func subtract() {
        guard numberStack.size > 0 else {
            return
        }
        
        while operatorStack.top != nil {
            let `operator` = operatorStack.pop()
            guard let number1 = numberStack.pop(), let number2 = numberStack.pop() else {
                /// - TODO: numberStack size가 2보다 작을 경우에 대한 예외처리.
                return
            }
            
            switch `operator` {
            case "+":
                numberStack.push(number2 + number1)
            case "-":
                numberStack.push(number2 - number1)
            case "*":
                numberStack.push(number2 * number1)
            case "/":
                numberStack.push(number2 / number1)
            default:
                /// - TODO: 잘못된 연산자가 스택에 있을 경우에 대한 예외처리.
                print("잘못된 연산자")
            }
        }
        
        operatorStack.push("-")
    }
    
    func multiply() {
        guard numberStack.size > 0 else {
            return
        }
        
        while let top = operatorStack.top, top == "*" || top == "/" {
            let `operator` = operatorStack.pop()
            guard let number1 = numberStack.pop(), let number2 = numberStack.pop() else {
                /// - TODO: numberStack size가 2보다 작을 경우에 대한 예외처리.
                return
            }
            
            switch `operator` {
            case "*":
                numberStack.push(number2 * number1)
            case "/":
                numberStack.push(number2 / number1)
            default:
                /// - TODO: 잘못된 연산자가 스택에 있을 경우에 대한 예외처리.
                print("잘못된 연산자")
            }
        }
        
        operatorStack.push("*")
    }
    
    func clear() {
        operatorStack.removeAll()
        numberStack.removeAll()
    }
    
    func divide() {
        guard numberStack.size > 0 else {
            return
        }
        
        /// - TODO: divideByZero 에러 처리
        while let top = operatorStack.top, top == "*" || top == "/" {
            let `operator` = operatorStack.pop()
            guard let number1 = numberStack.pop(), let number2 = numberStack.pop() else {
                /// - TODO: numberStack size가 2보다 작을 경우에 대한 예외처리.
                return
            }
            
            switch `operator` {
            case "*":
                numberStack.push(number2 * number1)
            case "/":
                numberStack.push(number2 / number1)
            default:
                /// - TODO: 잘못된 연산자가 스택에 있을 경우에 대한 예외처리.
                print("잘못된 연산자")
            }
        }
        
        operatorStack.push("/")
    }
    
    func equal() throws -> Double {
        guard operatorStack.size > 0 && numberStack.size > 0 else {
            throw DecimalCalculatorError.emptyStack
        }
        
        if operatorStack.size == numberStack.size {
            /// - TODO: 마지막에 입력한 숫자를 숫자 스택에 넣도록 변경
            _ = operatorStack.pop()
        }
        
        while operatorStack.top != nil {
            let `operator` = operatorStack.pop()
            guard let number1 = numberStack.pop(), let number2 = numberStack.pop() else {
                throw DecimalCalculatorError.lackNumber
            }
            
            switch `operator` {
            case "+":
                numberStack.push(number2 + number1)
            case "-":
                numberStack.push(number2 - number1)
            case "*":
                numberStack.push(number2 * number1)
            case "/":
                numberStack.push(number2 / number1)
            default:
                /// - TODO: 잘못된 연산자가 스택에 있을 경우에 대한 예외처리.
                print("잘못된 연산자")
            }
        }
        
        guard let result = numberStack.pop() else {
            throw DecimalCalculatorError.stackItemError
        }
        
        return result
    }
    
    func check() {
        print(operatorStack, numberStack)
    }
    
}
