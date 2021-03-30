//
//  Calculator.swift
//  Calculator
//
//  Created by 덕복 on 2021/03/27.
//

import Foundation

class Calculator<OperandType: Operand, InfixOperatorType: InfixOperator, PrefixOperatorType: PrefixOpreator> {
    private var postfixedList = Array<CalculatingElement>()
    private var operandStack = Stack<OperandType>()
    private var infixOperatorStack = Stack<InfixOperatorType>()
    private(set) var lastOperand: OperandType?
    private(set) var lastOperator: InfixOperatorType?
    private(set) var calculated: OperandType? {
        didSet {
            guard let toPrint = calculated else { return }
            print("calculated: \(toPrint), postfixedList: \(postfixedList), operandStack: \(operandStack), operatorStack: \(infixOperatorStack)")
        }
    }
    
    fileprivate init() { }
    
    fileprivate func calculate(by prefixOperator: PrefixOperatorType, x: OperandType) -> OperandType {
        return OperandType.zero
    }
    
    fileprivate func calculate(lhs: OperandType, by infixOperator: InfixOperatorType, rhs: OperandType) -> OperandType {
        return OperandType.zero
    }
    
    func appendPostfixedList(_ operand: OperandType) {
        postfixedList.append(operand)
        lastOperand = operand
    }
    
    func appendPostfixedList(_ infixOperator: InfixOperatorType) {
        while infixOperatorStack.isNotEmpty {
            if infixOperator.isPrecedence(over: infixOperatorStack.peek()!) { break }
            guard let infixOperator = infixOperatorStack.pop() else { return }
            
            postfixedList.append(infixOperator)
            operate()
        }
        
        infixOperatorStack.push(infixOperator)
        lastOperator = infixOperator
    }
    
    func appendPostfixedList(contentsOf elements: String) {
        for element in elements.components(separatedBy: " ") {
            if let infixOperator = InfixOperatorType(rawValue: element) {
                appendPostfixedList(infixOperator)
            }
            if let operand = OperandType(element) {
                appendPostfixedList(operand)
            }
        }
    }
    
    private func operate() {
        while false == postfixedList.isEmpty {
            let element = postfixedList.removeFirst()
            if element is OperandType {
                operandStack.push(element as! OperandType)
            }
            if element is InfixOperatorType {
                let infixOperator = element as! InfixOperatorType
                guard let rightOperand = operandStack.pop() else { return }
                guard let leftOperand = operandStack.pop() else { return }
                calculated = calculate(lhs: leftOperand, by: infixOperator, rhs: rightOperand)
                operandStack.push(calculated!)
            }
        }
    }
    
    func equal() {
        while infixOperatorStack.isNotEmpty {
            guard let infixOperator = infixOperatorStack.pop() else { return }
            postfixedList.append(infixOperator)
        }
        operate()
    }
    
    func clear() {
        postfixedList.removeAll()
        infixOperatorStack.clear()
        operandStack.clear()
    }
}

class DecimalCalculator: Calculator<Double, DecimalInfixOperator, DecimalPrefixOperator> {
    static let shared = DecimalCalculator()
    
    override func calculate(by prefixOperator: DecimalPrefixOperator, x: Double) -> Double {
        switch prefixOperator {
        case .unaryMinus:
            return -x
        }
    }
    
    override func calculate(lhs: Double, by infixOperator: DecimalInfixOperator, rhs: Double) -> Double {
        let result: Double
        
        switch infixOperator {
        case .multifly:
            result = lhs * rhs
        case .divide:
            result = lhs / rhs
        case .add:
            result = lhs + rhs
        case .subtract:
            result = lhs - rhs
        }
        
        return result.truncatingRemainder(dividingBy: Double(Double.maxByDigits) + 1).ceiledByDigits()
    }
}

class BinaryCalculator: Calculator<Binary, BinaryInfixOpeartor, BinaryPrefixOperator> {
    static let shared = BinaryCalculator()
    
    override func calculate(by prefixOperator: BinaryPrefixOperator, x: Binary) -> Binary {
        let value: Int = x.value
        
        switch prefixOperator {
        case .bitwiseNOT:
            return Binary(~value)
        case .unaryMinus:
            return Binary(-value)
        }
    }
    
    override func calculate(lhs: Binary, by infixOperator: BinaryInfixOpeartor, rhs: Binary) -> Binary {
        let leftValue: Int = lhs.value
        let rightValue: Int = rhs.value
        
        switch infixOperator {
        case .bitwiseLeftShift:
            return Binary(leftValue << rightValue)
        case .bitwiseRightShift:
            return Binary(leftValue >> rightValue)
        case .bitwiseAND:
            return Binary(leftValue & rightValue)
        case .bitwiseNAND:
            return Binary(~leftValue | ~rightValue)
        case .add:
            return Binary(leftValue + rightValue)
        case .subtract:
            return Binary(leftValue - rightValue)
        case .bitwiseOR:
            return Binary(leftValue | rightValue)
        case .bitwiseNOR:
            return Binary(~leftValue & ~rightValue)
        case .bitwiseXOR:
            return Binary(leftValue ^ rightValue)
        }
    }
}
