//
//  Calculator.swift
//  Calculator
//
//  Created by 잼킹 on 2021/06/23.
//

import Foundation

class Calculator: Calculable {
    private var equationStack = Stack<String>()
    private var infixExpression = Array<String>()
    private var postfixExpression = Array<String>()
}

extension Calculator {
    func putIntoInfix(of input: String) {
        infixExpression.append(input)
    }
    
    func changeToPostfixExpression() throws {
        for element in infixExpression {
            if Double(element) != nil {
                postfixExpression.append(element)
            } else {
                let presentOperator = try Operator.obtainOperator(from: element)
                while true {
                    if equationStack.isEmpty {
                        equationStack.push(element: element)
                        break
                    }
                    guard let topOfStack = equationStack.peek(), let stackOperator = try? Operator.obtainOperator(from: topOfStack) else {
                        throw CalculatorError.unknown
                    }
                    if presentOperator.isHigherPriority(than: stackOperator) {
                        equationStack.push(element: element)
                        break
                    } else {
                        guard let operatorSymbol = equationStack.pop() else {
                            throw CalculatorError.unknown
                        }
                        postfixExpression.append(operatorSymbol)
                    }
                }
            }
        }
        while !equationStack.isEmpty {
            guard let operatorSymbol = equationStack.pop() else {
                throw CalculatorError.unknown
            }
            postfixExpression.append(operatorSymbol)
        }
    }
    
    func evaluatePostfixExpression() -> Result<Double, CalculatorError> {
        for element in postfixExpression {
            if Double(element) != nil {
                equationStack.push(element: element)
            } else {
                guard let firstValue = equationStack.pop(), let secondValue = equationStack.pop(), let rhsValue = Double(firstValue), let lhsValue = Double(secondValue), let operatorSymbol = try? Operator.obtainOperator(from: element) else {
                    return .failure(.unknown)
                }
                switch operatorSymbol {
                case .add:
                    equationStack.push(element: String(add(lhs: lhsValue, rhs: rhsValue)))
                case .subtract:
                    equationStack.push(element: String(subtract(lhs: lhsValue, rhs: rhsValue)))
                case .multiply:
                    equationStack.push(element: String(multiply(lhs: lhsValue, rhs: rhsValue)))
                case .divide:
                    do {
                        let result = try divide(lhs: lhsValue, rhs: rhsValue)
                        equationStack.push(element: String(result))
                    } catch {
                        return .failure(.divideByZero)
                    }
                }
            }
        }
        guard let lastValue = equationStack.pop(), let result = Double(lastValue) else {
            return .failure(.unknown)
        }
        return .success(result)
    }
}
