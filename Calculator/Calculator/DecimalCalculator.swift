//
//  DecimalCalculator.swift
//  Calculator
//
//  Created by 임성민 on 2020/12/08.
//

import Foundation

enum CalculatorError: Error {
    case divisionByZero
    case emptyStack
    case lackNumber
    case stackItemError
}

class DecimalCalculator: BasicCalculable, DecimalCalculable {
    struct Operator {
        let symbol: String
        let priority: Int
        let operate: (Double, Double) -> Double
        init(_ symbol: String, _ priority: Int, _ operate: @escaping (Double, Double) -> Double) {
            self.symbol = symbol
            self.priority = priority
            self.operate = operate
        }
    }
    
    enum DecimalCalculatorOperator {
        case add
        case subtract
        case multiply
        case divide
    }
    
    private var operatorStack: Stack<DecimalCalculatorOperator> = Stack<DecimalCalculatorOperator>()
    private var operandStack: Stack<Double> = Stack<Double>()
    private var operatorDetails: [DecimalCalculatorOperator: Operator] = [
        .add: Operator("+", 4, {(operand1: Double, operand2: Double) in return operand1 + operand2}),
        .subtract: Operator("-", 4, {(operand1: Double, operand2: Double) in return operand1 - operand2}),
        .multiply: Operator("*", 3, {(operand1: Double, operand2: Double) in return operand1 * operand2}),
        .divide: Operator("/", 3, {(operand1: Double, operand2: Double) in return operand2 / operand1})
    ]
    
    func pushNumber(_ number: Double) {
        operandStack.push(number)
    }
    
    /// - TODO: 연산자 2개이상이 연속으로 들어올경우에 대한 예외 처리.
    /// - TODO: 연산 함수의 리턴값이 필요할거 같다.
    func add() {
        guard operandStack.size > 0 else { return }
        
        guard let addOperatorDetail = operatorDetails[.add] else { return }
        
        while let lastOperator = operatorStack.top {
            guard let lastOperatorDetail = operatorDetails[lastOperator] else { return }
            
            if lastOperatorDetail.priority > addOperatorDetail.priority { break }
            
            _ = operatorStack.pop()
            
            guard let operand1 = operandStack.pop(), let operand2 = operandStack.pop() else {
                /// - TODO: numberStack size가 2보다 작을 경우에 대한 예외처리.
                return
            }
            
            let resultByLastOperator = lastOperatorDetail.operate(operand1, operand2)
            operandStack.push(resultByLastOperator)
        }
        
        operatorStack.push(.add)
    }
    
    func subtract() {
        guard operandStack.size > 0 else { return }
        
        guard let addOperatorDetail = operatorDetails[.subtract] else { return }
        
        while let lastOperator = operatorStack.top {
            guard let lastOperatorDetail = operatorDetails[lastOperator] else { return }
            
            if lastOperatorDetail.priority > addOperatorDetail.priority { break }
            
            _ = operatorStack.pop()
            
            guard let operand1 = operandStack.pop(), let operand2 = operandStack.pop() else {
                /// - TODO: numberStack size가 2보다 작을 경우에 대한 예외처리.
                return
            }
            
            let resultByLastOperator = lastOperatorDetail.operate(operand1, operand2)
            operandStack.push(resultByLastOperator)
        }
        
        operatorStack.push(.subtract)
    }
    
    func multiply() {
        guard operandStack.size > 0 else { return }
        
        guard let addOperatorDetail = operatorDetails[.multiply] else { return }
        
        while let lastOperator = operatorStack.top {
            guard let lastOperatorDetail = operatorDetails[lastOperator] else { return }
            
            if lastOperatorDetail.priority > addOperatorDetail.priority { break }
            
            _ = operatorStack.pop()
            
            guard let operand1 = operandStack.pop(), let operand2 = operandStack.pop() else {
                /// - TODO: numberStack size가 2보다 작을 경우에 대한 예외처리.
                return
            }
            
            let resultByLastOperator = lastOperatorDetail.operate(operand1, operand2)
            operandStack.push(resultByLastOperator)
        }
        
        operatorStack.push(.multiply)
    }
    
    func clear() {
        operatorStack.removeAll()
        operandStack.removeAll()
    }
    
    func divide() {
        guard operandStack.size > 0 else { return }
        
        guard let addOperatorDetail = operatorDetails[.divide] else { return }
        
        while let lastOperator = operatorStack.top {
            guard let lastOperatorDetail = operatorDetails[lastOperator] else { return }
            
            if lastOperatorDetail.priority > addOperatorDetail.priority { break }
            
            _ = operatorStack.pop()
            
            guard let operand1 = operandStack.pop(), let operand2 = operandStack.pop() else {
                /// - TODO: numberStack size가 2보다 작을 경우에 대한 예외처리.
                return
            }
            
            let resultByLastOperator = lastOperatorDetail.operate(operand1, operand2)
            operandStack.push(resultByLastOperator)
        }
        
        operatorStack.push(.divide)
    }
    
    func equal() throws -> Double {
        guard operatorStack.size > 0 && operandStack.size > 0 else {
            throw CalculatorError.emptyStack
        }
        
        if operatorStack.size == operandStack.size {
            /// - TODO: 마지막에 입력한 숫자를 숫자 스택에 넣도록 변경
            _ = operatorStack.pop()
        }
        
        while let lastOperator = operatorStack.pop() {
            guard let lastOperatorDetail = operatorDetails[lastOperator] else {
                /// - TODO: 적당한 에러로 교체 필요.
                throw CalculatorError.lackNumber
            }
            
            guard let operand1 = operandStack.pop(), let operand2 = operandStack.pop() else {
                throw CalculatorError.lackNumber
            }
            
            let resultByLastOperator = lastOperatorDetail.operate(operand1, operand2)
            operandStack.push(resultByLastOperator)
        }
        
        guard let result = operandStack.pop() else {
            throw CalculatorError.stackItemError
        }
        
        return result
    }
    
    func check() {
        print(operatorStack, operandStack)
    }
    
}
