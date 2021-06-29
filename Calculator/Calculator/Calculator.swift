//
//  Calculator.swift
//  Calculator
//
//  Created by tae hoon park on 2021/06/25.
//

import Foundation

enum Operator: String {
    
    case plus = "+"
    case minus = "-"
    case multiplication = "*"
    case division = "/"
    
    fileprivate var priority: Int {
        switch self {
        case .plus, .minus:
            return OperatorPriority.low.rawValue
        case .multiplication, .division:
            return OperatorPriority.high.rawValue
        }
    }
    
    static func < (lhs: Operator, rhs: Operator) -> Bool {
        lhs.priority < rhs.priority
    }
}

enum OperatorPriority: Int {
    
    case low = 0
    case high = 1
}

enum CalculatorError: Error {
    
    case unknown
    case dividedByZero
}

extension String {
    
    func toDouble() -> Bool {
        if let _ = Double(self) {
            return true
        }
        return false
    }
}

class Calculator {
    
    private var infixNotation = [String]()
    private var postfixNotation = [String]()
    private var OperandAndOperatorStack = Stack<String>()
    
    func converToPostfixNotation() throws -> [String] {
        itemsLoop: for item in infixNotation {
            if item.toDouble() {
                postfixNotation.append(item)
                continue itemsLoop
            }
            if OperandAndOperatorStack.isEmpty {
                OperandAndOperatorStack.push(item)
                continue itemsLoop
            }
            
            guard let topOfStack = OperandAndOperatorStack.top else { throw CalculatorError.unknown }
            guard let currentOperator = try? checkOperator(item) else { throw CalculatorError.unknown }
            guard let stackOperator = try? checkOperator(topOfStack) else { throw CalculatorError.unknown }
            
            if stackOperator.priority >= currentOperator.priority {
                guard let poppedValue = OperandAndOperatorStack.pop() else { throw CalculatorError.unknown }
                postfixNotation.append(poppedValue)
                OperandAndOperatorStack.push(item)
            } else {
                OperandAndOperatorStack.push(item)
            }
        }
        while OperandAndOperatorStack.isEmpty == false {
            guard let topOfStack = OperandAndOperatorStack.pop() else { throw CalculatorError.unknown }
            postfixNotation.append(topOfStack)
        }
        return postfixNotation
    }
    
    func checkOperator(_ input: String) throws -> Operator {
        guard let acquiredOperator = Operator(rawValue: input) else { throw CalculatorError.unknown }
        return acquiredOperator
    }
    
    func calculatePostfix() throws -> Double {
        for item in postfixNotation {
            if item.toDouble() {
                OperandAndOperatorStack.push(item)
            } else {
                guard let firstElement = OperandAndOperatorStack.pop(), let secondElement = OperandAndOperatorStack.pop() else { throw CalculatorError.unknown }
                guard let firstOperand = Double(firstElement),
                      let secondOperand = Double(secondElement) else { throw CalculatorError.unknown }
                
                let acquiredOperator = try? checkOperator(item)
                
                switch acquiredOperator {
                case .plus:
                    OperandAndOperatorStack.push(String(add(firstOperand, secondOperand)))
                case .minus:
                    OperandAndOperatorStack.push(String(substract(secondOperand, firstOperand)))
                case .multiplication:
                    OperandAndOperatorStack.push(String(multiply(firstOperand, secondOperand)))
                case .division:
                    let result = try divide(secondOperand, firstOperand)
                    OperandAndOperatorStack.push(String(result))
                default:
                    throw CalculatorError.unknown
                }
            }
        }
        guard let lastElement = OperandAndOperatorStack.pop(), let result = Double(lastElement) else {
            throw CalculatorError.unknown
        }
        return result
    }
}

extension Calculator: Calculatable {
    
    func add(_ firstOperand: Double, _ secondOperand: Double) -> Double {
        return firstOperand + secondOperand
    }
    
    func substract(_ firstOperand: Double, _ secondOperand: Double) -> Double {
        return firstOperand - secondOperand
    }
    
    func multiply(_ firstOperand: Double, _ secondOperand: Double) -> Double {
        return firstOperand * secondOperand
    }
    
    func divide(_ firstOperand: Double, _ secondOperand: Double) throws -> Double {
        if secondOperand == 0 {
            throw CalculatorError.dividedByZero
        }
        return firstOperand / secondOperand
    }
}

//MARK: - 테스트를 위한 메인함수
//func main() {
//    
//    let c = Calculator()
//    let a = try? c.converToPostfixNotation()
//    print(a)
//    let d = try? c.calculatePostfix()
//    print(d)
//}
