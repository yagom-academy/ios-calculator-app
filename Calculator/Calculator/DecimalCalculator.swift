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
    case operandError
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
    
    private(set) var operandBuffer: String = "0"
    private var operatorStack: Stack<DecimalCalculatorOperator> = Stack<DecimalCalculatorOperator>()
    private var operandStack: Stack<Double> = Stack<Double>()
    private var operatorDetails: [DecimalCalculatorOperator: Operator] = [
        .add: Operator("+", 4, {(operand1: Double, operand2: Double) in return operand2 + operand1}),
        .subtract: Operator("-", 4, {(operand1: Double, operand2: Double) in return operand2 - operand1}),
        .multiply: Operator("*", 3, {(operand1: Double, operand2: Double) in return operand2 * operand1}),
        .divide: Operator("/", 3, {(operand1: Double, operand2: Double) in return operand2 / operand1})
    ]
    
    func clearBuffer() {
        self.operandBuffer = "0"
    }
    
    func enterNumber(_ number: Character) {
        guard let numberAsciiValue = number.asciiValue else {
            return
        }
        
        guard let zeroAsciiValue = Character("0").asciiValue, let nineAsciiValue = Character("9").asciiValue else {
            return
        }
        
        guard numberAsciiValue >= zeroAsciiValue && Int(numberAsciiValue) <= nineAsciiValue else {
            return
        }
        
        operandBuffer += String(number)
    }
    
    func pushOperand() {
        guard let operand: Double = Double(operandBuffer) else {
            return
        }
        
        operandStack.push(operand)
        
        clearBuffer()
    }
    
    /// 입력된 priority 보다 작은 연산자를 operatorStack에서 pop 하고 연산하는 함수.
    /// add, subtract 등 연산자 함수에서 연산자를 operatorStack에 넣기 전에, 넣을 연산자보다 작은 우선순위 연산자를 pop 하기 위해 호출한다.
    ///
    /// - Parameter priority: 비교할 우선순위
    private func popOperatorLessThanPriority(_ priority: Int) {
        while let lastOperator = operatorStack.top {
            guard let lastOperatorDetail = operatorDetails[lastOperator] else { return }
            
            if lastOperatorDetail.priority > priority { break }
            
            _ = operatorStack.pop()
            
            /// - TODO: divideByZero 에러 예외처리 추가.
            
            guard let operand1 = operandStack.pop(), let operand2 = operandStack.pop() else {
                /// - TODO: numberStack size가 2보다 작을 경우에 대한 예외처리.
                return
            }
            
            let resultByLastOperator = lastOperatorDetail.operate(operand1, operand2)
            operandStack.push(resultByLastOperator)
        }
    }
    
    /// - TODO: 연산자 2개이상이 연속으로 들어올경우에 대한 예외 처리.
    /// - TODO: 연산 함수의 리턴 및 에러 쓰로우가 필요할거 같다.
    func add() {
        pushOperand()
        
        guard operandStack.size > 0 else { return }
        
        guard let addOperatorDetail = operatorDetails[.add] else { return }
        
        popOperatorLessThanPriority(addOperatorDetail.priority)
        
        operatorStack.push(.add)
    }
    
    func subtract() {
        pushOperand()
        
        guard operandStack.size > 0 else { return }
        
        guard let subtractOperatorDetail = operatorDetails[.subtract] else { return }
        
        popOperatorLessThanPriority(subtractOperatorDetail.priority)
        
        operatorStack.push(.subtract)
    }
    
    func multiply() {
        pushOperand()
        
        guard operandStack.size > 0 else { return }
        
        guard let multiplyOperatorDetail = operatorDetails[.multiply] else { return }
        
        popOperatorLessThanPriority(multiplyOperatorDetail.priority)
        
        operatorStack.push(.multiply)
    }
    
    func clear() {
        operatorStack.removeAll()
        operandStack.removeAll()
        clearBuffer()
    }
    
    func divide() {
        pushOperand()
        
        guard operandStack.size > 0 else { return }
        
        guard let divideOperatorDetail = operatorDetails[.divide] else { return }
        
        popOperatorLessThanPriority(divideOperatorDetail.priority)
        
        operatorStack.push(.divide)
    }
    
    func equal() throws -> Double {
        pushOperand()
        
        guard operatorStack.size > 0 && operandStack.size > 0 else {
            throw CalculatorError.emptyStack
        }
        
        if operatorStack.size == operandStack.size {
            /// - TODO: 마지막에 입력한 숫자를 숫자 스택에 넣도록 변경
            _ = operatorStack.pop()
        }
        
        popOperatorLessThanPriority(14)
        
        guard let result = operandStack.pop() else {
            throw CalculatorError.stackItemError
        }
        
        return result
    }
    
    func check() {
        print(operatorStack, operandStack)
    }
    
}
