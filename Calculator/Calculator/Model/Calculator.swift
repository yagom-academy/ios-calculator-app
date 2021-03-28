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
    private var operatorStack = Stack<InfixOperator>()
    private(set) var lastOperand: OperandType?
    private(set) var lastOperator: InfixOperator?
    private(set) var calculated: OperandType? {
        didSet {
            guard let toPrint = calculated else { return }
            print("calculated: \(toPrint), postfixedList: \(postfixedList), operandStack: \(operandStack), operatorStack: \(operatorStack)")
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
        while operatorStack.isNotEmpty {
            if operatorStack.peek()!.isPrecedence(over: infixOperator) {
                postfixedList.append(operatorStack.pop())
                operate()
            } else { break }
        }
        operatorStack.push(infixOperator)
        lastOperator = infixOperator
    }
    
    func appendPostfixedList(contentsOf elements: String) {
        for element in elements.components(separatedBy: " ") {
            for infixOperator in InfixOperator.allCases {
                if(infixOperator.rawValue == element) {
                    appendPostfixedList(infixOperator)
                }
            }
            
            guard let operand = OperandType(element) else { continue }
            appendPostfixedList(operand)
        }
    }
    
    private func operate() {
        while false == postfixedList.isEmpty {
            let element = postfixedList.removeFirst()
            if element is OperandType {
                operandStack.push(element as! OperandType)
            } else if element is InfixOperator {
                let infixOperator = element as! InfixOperator
                let rightOperand = operandStack.pop()
                calculated = calculate(lhs: operandStack.pop(), by: infixOperator, rhs: rightOperand)
                operandStack.push(calculated!)
            }
        }
    }
    
    func equal() {
        while operatorStack.isNotEmpty {
            postfixedList.append(operatorStack.pop())
        }
        operate()
    }
    
    func clear() {
        postfixedList.removeAll()
        operatorStack.clear()
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
