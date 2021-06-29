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
                  let isPreceded = try? isHigherPriority(of: element, than: topOfStack),
                  isPreceded == true {
            return true
        } else {
            return false
        }
    }
    
    private func isEqualSign(of element: String) -> Bool {
        return element == "="
    }
    
    private func handle(operator element: String) throws {
        while !isEqualSign(of: element) {
            if try isNecessaryToPutInStackNow(about: element) {
                equationStack.push(element)
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
    
    private func changeToPostfixExpression() throws {
        for element in infixExpression {
            if isNumber(element) {
                postfixExpression.append(element)
            } else {
                try handle(operator: element)
            }
        }
        try sendOperatorsToPostfixFromStack()
    }
    
    private func extractOperandsFromStack() throws -> (lhsValue: Double, rhsValue: Double) {
        guard let firstValue = equationStack.pop(),
              let secondValue = equationStack.pop(),
              let lhsValue = Double(secondValue),
              let rhsValue = Double(firstValue) else {
            throw CalculatorError.unknown
        }
        return (lhsValue, rhsValue)
    }
    
    private func calculate(by element: String, lhsValue: Double, rhsValue: Double) throws {
        guard let operatorSymbol = try? Operator.obtainOperator(from: element) else {
            throw CalculatorError.unknown
        }
        switch operatorSymbol {
        case .add:
            equationStack.push(String(add(lhs: lhsValue, rhs: rhsValue)))
        case .subtract:
            equationStack.push(String(subtract(lhs: lhsValue, rhs: rhsValue)))
        case .multiply:
            equationStack.push(String(multiply(lhs: lhsValue, rhs: rhsValue)))
        case .divide:
            let result = try divide(lhs: lhsValue, rhs: rhsValue)
            equationStack.push(String(result))
        }
    }
    
    private func findOutTheLastValue() throws -> Double {
        guard let lastValue = equationStack.pop(), let result = Double(lastValue) else {
            throw CalculatorError.unknown
        }
        return result
    }
    
    private func evaluatePostfixExpression() throws -> Double {
        for element in postfixExpression {
            if isNumber(element) {
                equationStack.push(element)
            } else {
                let (lhs, rhs) = try extractOperandsFromStack()
                try calculate(by: element, lhsValue: lhs, rhsValue: rhs)
            }
        }
        return try findOutTheLastValue()
    }
    
    func deriveEquationValue() -> Result<Double, CalculatorError> {
        do {
            try changeToPostfixExpression()
            let result = try evaluatePostfixExpression()
            return .success(result)
        } catch let error as CalculatorError {
            return .failure(error)
        } catch {
            return .failure(.unknown)
        }
    }
}
