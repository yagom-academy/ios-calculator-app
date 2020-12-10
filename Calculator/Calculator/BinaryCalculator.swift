//
//  BinaryCalculator.swift
//  Calculator
//
//  Created by 임성민 on 2020/12/10.
//

import Foundation

class BianryCalculator: BasicCalculable, BinaryCalculable {
    struct Operator {
        let symbol: String
        let priority: Int
        let operate: (Int, Int) -> Int
        
        init(_ symbol: String, _ priority: Int, _ operate: @escaping (Int, Int) -> Int) {
            self.symbol = symbol
            self.priority = priority
            self.operate = operate
        }
    }
    
    enum BinaryCalculatorOperator {
        case add, subtract, and, or, xor, nor, nand
    }
    
    private(set) var operandBuffer: String = "0"
    private var operatorStack: Stack<BinaryCalculatorOperator> = Stack<BinaryCalculatorOperator>()
    private var operandStack: Stack<Int> = Stack<Int>()
    private var operatorDetails: [BinaryCalculatorOperator: Operator] = [
        .add: Operator("+", 4, {(operand1: Int, operand2: Int) in return operand2 + operand1}),
        .subtract: Operator("-", 4, {(operand1: Int, operand2: Int) in return operand2 - operand1}),
        .and: Operator("&", 8, {(operand1: Int, operand2: Int) in return operand2 & operand1}),
        .or: Operator("|", 10, {(operand1: Int, operand2: Int) in return operand2 | operand1}),
        .xor: Operator("^", 9, {(operand1: Int, operand2: Int) in return operand2 ^ operand1}),
        .nor: Operator("~|", 10, {(operand1: Int, operand2: Int) in return ~(operand2 | operand1)}),
        .nand: Operator("~&", 8, {(operand1: Int, operand2: Int) in return ~(operand2 & operand1)})
    ]
    
    func clearBuffer() {
        self.operandBuffer = "0"
    }
    
    func enterNumber(_ number: Character) {
        guard let numberAsciiValue = number.asciiValue else {
            return
        }
        
        guard let zeroAsciiValue = Character("0").asciiValue, let oneAsciiValue = Character("1").asciiValue else {
            return
        }
        
        guard numberAsciiValue >= zeroAsciiValue && Int(numberAsciiValue) <= oneAsciiValue else {
            return
        }
        
        operandBuffer += String(number)
    }
    
    func pushOperand() {
        guard let operand: Int = Int(operandBuffer) else {
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
    
    func and() {
        pushOperand()
        
        guard operandStack.size > 0 else { return }
        
        guard let andOperatorDetail = operatorDetails[.and] else { return }
        
        popOperatorLessThanPriority(andOperatorDetail.priority)
        
        operatorStack.push(.and)
    }
    
    func or() {
        pushOperand()
        
        guard operandStack.size > 0 else { return }
        
        guard let orOperatorDetail = operatorDetails[.or] else { return }
        
        popOperatorLessThanPriority(orOperatorDetail.priority)
        
        operatorStack.push(.or)
    }
    
    func xor() {
        pushOperand()
        
        guard operandStack.size > 0 else { return }
        
        guard let xorOperatorDetail = operatorDetails[.xor] else { return }
        
        popOperatorLessThanPriority(xorOperatorDetail.priority)
        
        operatorStack.push(.xor)
    }
    
    func nor() {
        pushOperand()
        
        guard operandStack.size > 0 else { return }
        
        guard let norOperatorDetail = operatorDetails[.nor] else { return }
        
        popOperatorLessThanPriority(norOperatorDetail.priority)
        
        operatorStack.push(.nor)
    }
    
    func nand() {
        pushOperand()
        
        guard operandStack.size > 0 else { return }
        
        guard let nandOperatorDetail = operatorDetails[.nand] else { return }
        
        popOperatorLessThanPriority(nandOperatorDetail.priority)
        
        operatorStack.push(.nand)
    }
    
    func not() {
        guard let operand: Int = Int(operandBuffer, radix: 2) else {
            return
        }
        
        let result = ~operand
        
        operandBuffer = String(result, radix: 2)
    }
    
    
    func leftShift() {
        guard let operand: Int = Int(operandBuffer, radix: 2) else {
            return
        }
        
        let result = operand << 1
        
        operandBuffer = String(result, radix: 2)
    }
    
    func rightShift() {
        guard let operand: Int = Int(operandBuffer, radix: 2) else {
            return
        }
        
        let result = operand >> 1
        
        operandBuffer = String(result, radix: 2)
    }
    
    func clear() {
        operatorStack.removeAll()
        operandStack.removeAll()
        clearBuffer()
    }
    
}
