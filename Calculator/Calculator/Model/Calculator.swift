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
    func putIntoInfixExpression(of input: String) {
        infixExpression.append(input)
    }
    
    private func isNumber(_ value: String) -> Bool {
        return Double(value) != nil
    }
    
    private func isHigherPriority(of infixOperator: String,than stackOperator: String) throws -> Bool {
        guard let presentOperator = try? Operator.obtainOperator(from: infixOperator),
              let stackOperator = try? Operator.obtainOperator(from: stackOperator) else {
            throw CalculatorError.unknown
        }
        return presentOperator.isHigherPriority(than: stackOperator)
    }
    
    private func isNecessaryToPutInStackNow(about element: String) throws -> Bool {
        if equationStack.isEmpty {
            return true
        } else if let topOfStack = equationStack.peek(),
                  (try? isHigherPriority(of: element, than: topOfStack)) != nil {
            return true
        } else {
            return false
        }
    }
    
    private func handle(operator element: String) throws {
        while true {
            if try isNecessaryToPutInStackNow(about: element) {
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
    
    private func sendOperatorsToPostfixFromStack() throws {
        while !equationStack.isEmpty {
            guard let operatorSymbol = equationStack.pop() else {
                throw CalculatorError.unknown
            }
            postfixExpression.append(operatorSymbol)
        }
    }
    
    func changeToPostfixExpression() throws {
        for element in infixExpression {
            if isNumber(element) {
                postfixExpression.append(element)
            } else {
                try handle(operator: element)
            }
        }
        try sendOperatorsToPostfixFromStack()
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
