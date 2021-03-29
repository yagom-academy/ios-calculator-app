//
//  Calculator.swift
//  Calculator
//
//  Created by 덕복 on 2021/03/27.
//

import Foundation

class Calculator<OperandType: Operand> {
    private var postfixedList = Array<CalculatingElement>()
    private var operandStack = Stack<OperandType>()
    private var infixOperatorStack = Stack<InfixOperator>()
    private(set) var lastOperand: OperandType?
    private(set) var lastOperator: InfixOperator?
    private(set) var calculated: OperandType? {
        didSet {
            guard let toPrint = calculated else { return }
            print("calculated: \(toPrint), postfixedList: \(postfixedList), operandStack: \(operandStack), operatorStack: \(infixOperatorStack)")
        }
    }
    
    fileprivate init() { }
    
    fileprivate func calculate(lhs: OperandType, by infixOperator: InfixOperator, rhs: OperandType) -> OperandType {
        switch infixOperator {
        case .add:
            return lhs + rhs
        case .subtract:
            return lhs - rhs
        default:
            return OperandType.zero
        }
    }
    
    func appendPostfixedList(_ operand: OperandType) {
        postfixedList.append(operand)
        lastOperand = operand
    }
    
    func appendPostfixedList(_ infixOperator: InfixOperator) {
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
            if let infixOperator = InfixOperator(rawValue: element) {
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
            } else if element is InfixOperator {
                let infixOperator = element as! InfixOperator
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

class DecimalCalculator: Calculator<Double> {
    static let shared = DecimalCalculator()
    
    override func calculate(lhs: Double, by infixOperator: InfixOperator, rhs: Double) -> Double {
        var result: Double
        
        switch infixOperator {
        case .multifly:
            result = lhs * rhs
        case .divide:
            result = lhs / rhs
        case .add:
            result = lhs + rhs
        case .subtract:
            result = lhs - rhs
        default:
            return Double.zero
        }
        
        return result.truncatingRemainder(dividingBy: Double(Double.maxByDigits) + 1).ceiledByDigits()
    }
}

class BinaryCalculator: Calculator<Binary> {
    static let shared = BinaryCalculator()
    
    override func calculate(lhs: Binary, by infixOperator: InfixOperator, rhs: Binary) -> Binary {
        switch infixOperator {
        case .bitwiseLeftShift:
            return lhs << rhs
        case .bitwiseRightShift:
            return lhs >> rhs
        case .bitwiseAND:
            return lhs & rhs
        case .bitwiseNAND:
            return lhs ~& rhs
        case .add:
            return lhs + rhs
        case .subtract:
            return lhs - rhs
        case .bitwiseOR:
            return lhs | rhs
        case .bitwiseNOR:
            return lhs ~| rhs
        case .bitwiseXOR:
            return lhs ^ rhs
        default:
            return Binary.zero
        }
    }
}
