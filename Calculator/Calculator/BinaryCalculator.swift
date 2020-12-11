//
//  BinaryCalculator.swift
//  Calculator
//
//  Created by 임성민 on 2020/12/10.
//

import Foundation

class BianryCalculator: BasicCalculable, BinaryCalculable {
    struct OperatorDetail {
        let symbol: String
        let priority: Int
        let operation: ((Int, Int) -> Int)?
        
        init(_ symbol: String, _ priority: Int, _ operate: ((Int, Int) -> Int)?) {
            self.symbol = symbol
            self.priority = priority
            self.operation = operate
        }
    }
    
    enum BinaryCalculatorOperator {
        case add, subtract, and, or, xor, nor, nand, equal
    }
    
    /// 사용자가 숫자를 터치하면 버퍼에 저장하고, 연산자를 터치하면 버퍼에 모인 숫자를 피연산자 스택에 저장하기 위함.
    private var operandBuffer: String = "0"
    
    /// 연산자가 바로 직전에 푸쉬됐는지 확인하여, 연산자가 여러개 푸쉬 되는 것을 방지.
    private var isPushingOperatorJustBefore: Bool = false
    
    private var operatorStack: Stack<BinaryCalculatorOperator> = Stack<BinaryCalculatorOperator>()
    
    private var operandStack: Stack<Int> = Stack<Int>()
    
    private var operatorDetails: [BinaryCalculatorOperator: OperatorDetail] = [
        .add: OperatorDetail("+", 3, {(operand1: Int, operand2: Int) in return operand2 + operand1}),
        .subtract: OperatorDetail("-", 3, {(operand1: Int, operand2: Int) in return operand2 - operand1}),
        .and: OperatorDetail("&", 2, {(operand1: Int, operand2: Int) in return operand2 & operand1}),
        .or: OperatorDetail("|", 3, {(operand1: Int, operand2: Int) in return operand2 | operand1}),
        .xor: OperatorDetail("^", 3, {(operand1: Int, operand2: Int) in return operand2 ^ operand1}),
        .nor: OperatorDetail("~|", 3, {(operand1: Int, operand2: Int) in return ~(operand2 | operand1)}),
        .nand: OperatorDetail("~&", 2, {(operand1: Int, operand2: Int) in return ~(operand2 & operand1)}),
        .equal: OperatorDetail("=", 5, nil)
    ]
    
    func clearBuffer() {
        self.operandBuffer = "0"
    }
    
    /// 0 또는 1을 입력받아서 버퍼에 저장하는 함수.
    ///
    /// - Parameter number: 0 또는 1
    /// - Throws:
    ///     - 아스키 값 얻는 것을 실패하면 'CalculatorError.asciiValueError'.
    ///     - 0 또는 1 이외의 값이 입력되면 'CalculatorError.inputNumberError'.
    /// - Returns: 현재 버퍼에 저장되어있는 문자열.
    func enterNumber(_ number: Character) throws -> String {
        guard let numberAsciiValue = number.asciiValue else {
            throw CalculatorError.asciiValueError
        }
        
        guard let zeroAsciiValue = Character("0").asciiValue, let oneAsciiValue = Character("1").asciiValue else {
            throw CalculatorError.asciiValueError
        }
        
        guard numberAsciiValue >= zeroAsciiValue && Int(numberAsciiValue) <= oneAsciiValue else {
            throw CalculatorError.inputNumberError
        }
        
        operandBuffer += String(number)
        
        /// 버퍼값을 Int로 변환하여 유효한 값인지 확인.
        guard let validOperand = Int(operandBuffer, radix: 2) else {
            throw CalculatorError.inputNumberError
        }
        
        operandBuffer = String(validOperand, radix: 2)
        
        isPushingOperatorJustBefore = false
        
        return operandBuffer
    }
    
    /// 사용자가 연산자를 입력하면, 버퍼에 저장되어있는 숫자들을 피연산자로서 스택에 푸쉬하기 위한 함수.
    func pushOperand() {
        guard let operand: Int = Int(operandBuffer, radix: 2) else {
            return
        }
        
        operandStack.push(operand)
        
        clearBuffer()
    }
    
    /// 사용자가 연산자를 입력(터치)하면 스택에 연산자를 푸쉬하기 위한 함수.
    /// 넣으려는 연산자보다 우선순위가 먼저인 연산자는 pop하여 연산한다.
    ///
    /// - Parameter operator: 스텍에 넣을 연산자.
    /// - Throws:
    ///     - 0으로 나눌 경우, 'CalculatorError.divisionByZero'.
    ///     - 피연산자가 부족할 경우(잘못된 피연산자 입력), 'CalculatorError.operandError'.
    private func pushOperater(_ `operator`: BinaryCalculatorOperator) throws {
        guard operandStack.size > 0 else { return }
        
        guard let pushedOperatorDetail = operatorDetails[`operator`] else { return }
        
        while let lastOperator = operatorStack.top {
            guard let lastOperatorDetail = operatorDetails[lastOperator] else { return }
            
            if lastOperatorDetail.priority > pushedOperatorDetail.priority {
                break
            }
            
            _ = operatorStack.pop()
            
            guard let operand1 = operandStack.pop(), let operand2 = operandStack.pop() else {
                /// - TODO: numberStack size가 2보다 작을 경우에 대한 예외처리.
                return
            }
            
            guard let operate = lastOperatorDetail.operation else { return }
            
            let resultByLastOperator = operate(operand1, operand2)
            
            operandStack.push(resultByLastOperator)
        }
        
        operatorStack.push(`operator`)
        
        isPushingOperatorJustBefore = true
    }
    
    /// 더하기 연산자를 스택에 푸쉬하는 함수.
    ///
    /// - Throws:
    ///     - 피연산자가 부족할 경우(잘못된 피연산자 입력), 'CalculatorError.operandError'.
    ///     - pushOperator함수에서 발생한 에러를 전달.
    /// - Returns: 스택의 가장 최근 피연산자 값을 문자열로 반환.
    func add() throws -> String {
        guard isPushingOperatorJustBefore != true else {
            _ = operatorStack.pop()
            operatorStack.push(.add)
            
            guard let lastOperand = operandStack.top else {
                throw CalculatorError.operandError
            }
            
            return String(lastOperand, radix: 2)
        }
        
        pushOperand()
        
        do {
            try pushOperater(.add)
            
            guard let lastOperand = operandStack.top else {
                throw CalculatorError.operandError
            }
            
            return String(lastOperand, radix: 2)
        } catch(let error) {
            throw error
        }
    }
    
    func subtract() throws -> String {
        guard isPushingOperatorJustBefore != true else {
            _ = operatorStack.pop()
            operatorStack.push(.subtract)
            
            guard let lastOperand = operandStack.top else {
                throw CalculatorError.operandError
            }
            
            return String(lastOperand, radix: 2)
        }
        
        pushOperand()
        
        do {
            try pushOperater(.subtract)
            
            guard let lastOperand = operandStack.top else {
                throw CalculatorError.operandError
            }
            
            return String(lastOperand, radix: 2)
        } catch(let error) {
            throw error
        }
    }
    
    func and() throws -> String{
        guard isPushingOperatorJustBefore != true else {
            _ = operatorStack.pop()
            operatorStack.push(.and)
            
            guard let lastOperand = operandStack.top else {
                throw CalculatorError.operandError
            }
            
            return String(lastOperand, radix: 2)
        }
        
        pushOperand()
        
        do {
            try pushOperater(.and)
            
            guard let lastOperand = operandStack.top else {
                throw CalculatorError.operandError
            }
            
            return String(lastOperand, radix: 2)
        } catch(let error) {
            throw error
        }
    }
    
    func or() throws -> String {
        guard isPushingOperatorJustBefore != true else {
            _ = operatorStack.pop()
            operatorStack.push(.or)
            
            guard let lastOperand = operandStack.top else {
                throw CalculatorError.operandError
            }
            
            return String(lastOperand, radix: 2)
        }
        
        pushOperand()
        
        do {
            try pushOperater(.or)
            
            guard let lastOperand = operandStack.top else {
                throw CalculatorError.operandError
            }
            
            return String(lastOperand, radix: 2)
        } catch(let error) {
            throw error
        }
    }
    
    func xor() throws -> String {
        guard isPushingOperatorJustBefore != true else {
            _ = operatorStack.pop()
            operatorStack.push(.xor)
            
            guard let lastOperand = operandStack.top else {
                throw CalculatorError.operandError
            }
            
            return String(lastOperand, radix: 2)
        }
        
        pushOperand()
        
        do {
            try pushOperater(.xor)
            
            guard let lastOperand = operandStack.top else {
                throw CalculatorError.operandError
            }
            
            return String(lastOperand, radix: 2)
        } catch(let error) {
            throw error
        }
    }
    
    func nor() throws -> String {
        guard isPushingOperatorJustBefore != true else {
            _ = operatorStack.pop()
            operatorStack.push(.nor)
            
            guard let lastOperand = operandStack.top else {
                throw CalculatorError.operandError
            }
            
            return String(lastOperand, radix: 2)
        }
        
        pushOperand()
        
        do {
            try pushOperater(.nor)
            
            guard let lastOperand = operandStack.top else {
                throw CalculatorError.operandError
            }
            
            return String(lastOperand, radix: 2)
        } catch(let error) {
            throw error
        }
    }
    
    func nand() throws -> String {
        guard isPushingOperatorJustBefore != true else {
            _ = operatorStack.pop()
            operatorStack.push(.nand)
            
            guard let lastOperand = operandStack.top else {
                throw CalculatorError.operandError
            }
            
            return String(lastOperand, radix: 2)
        }
        
        pushOperand()
        
        do {
            try pushOperater(.nand)
            
            guard let lastOperand = operandStack.top else {
                throw CalculatorError.operandError
            }
            
            return String(lastOperand, radix: 2)
        } catch(let error) {
            throw error
        }
    }
    
    func not() throws -> String {
        guard let operand: Int = Int(operandBuffer, radix: 2) else {
            throw CalculatorError.operandError
        }
        
        let result = ~operand
        
        operandBuffer = String(result, radix: 2)
        
        return operandBuffer
    }
    
    
    func leftShift() throws -> String {
        guard let operand: Int = Int(operandBuffer, radix: 2) else {
            throw CalculatorError.operandError
        }
        
        let result = operand << 1
        
        operandBuffer = String(result, radix: 2)
        
        return operandBuffer
    }
    
    func rightShift() throws -> String {
        guard let operand: Int = Int(operandBuffer, radix: 2) else {
            throw CalculatorError.operandError
        }
        
        let result = operand >> 1
        
        operandBuffer = String(result, radix: 2)
        
        return operandBuffer
    }
    
    func equal() throws -> String {
        guard isPushingOperatorJustBefore != true else {
            guard let lastOperand = operandStack.top else {
                throw CalculatorError.operandError
            }
            
            return String(lastOperand, radix: 2)
        }
        
        pushOperand()
        
        do {
            try pushOperater(.equal)
            
            _ = operatorStack.pop()
            
            guard let lastOperand = operandStack.top else {
                throw CalculatorError.operandError
            }
            
            return String(lastOperand, radix: 2)
        } catch(let error) {
            throw error
        }
    }
    
    func clear() {
        operatorStack.removeAll()
        operandStack.removeAll()
        clearBuffer()
    }
    
}
