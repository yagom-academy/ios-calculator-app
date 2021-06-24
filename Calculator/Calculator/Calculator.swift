//
//  Calculator.swift
//  Calculator
//
//  Created by 잼킹 on 2021/06/23.
//

import Foundation

enum CalculationResult {
    case success(Double)
    case failure
}

class Calculator {
    private var stack = Stack<String>()
    private var infix = Array<String>()
    private var postfix = Array<String>()
}

extension Calculator: Calculable {
    func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
    
    func divide(lhs: Double, rhs: Double) throws -> Double {
        if rhs == 0.0 {
            throw CalculatorError.divideByZero
        }
        return lhs / rhs
    }
}

extension Calculator {
    func putIntoInfix(of input: String) {
        infix.append(input)
    }
    
    func changeToPosfix() {
        for element in infix {
            if Double(element) != nil {
                postfix.append(element)
            } else {
                
                while true {
                    guard let topOfStack = stack.peek() else {
                        break
                    }
                    if stack.isEmpty || Operator.obtainOperator(from: element).isHigherPriority(than: Operator.obtainOperator(from: topOfStack)) {
                        stack.push(element: element)
                        break
                    } else {
                        guard let `operator` = stack.pop() else {
                            
                        }
                        postfix.append(`operator`)
                    }
                }
            }
        }
        while !stack.isEmpty {
            guard let `operator` = stack.pop() else {
                <#statements#>
            }
            postfix.append(`operator`)
        }
    }
    
    func evaluatePostfix() -> CalculationResult {
        for element in postfix {
            if Double(element) != nil {
                stack.push(element: element)
            } else {
                guard let firstValue = stack.pop(), let secondValue = stack.pop(), let rhsValue = Double(firstValue), let lhsValue = Double(secondValue) else {
                    return .failure
                }
                let `operator` = Operator.obtainOperator(from: element)
                switch `operator` {
                case .add:
                    stack.push(element: String(add(lhs: lhsValue, rhs: rhsValue)))
                case .subtract:
                    stack.push(element: String(subtract(lhs: lhsValue, rhs: rhsValue)))
                case .multiply:
                    stack.push(element: String(multiply(lhs: lhsValue, rhs: rhsValue)))
                case .divide:
                    do {
                        let result = try divide(lhs: lhsValue, rhs: rhsValue)
                        stack.push(element: String(result))
                    } catch {
                        return .failure
                    }
                }
            }
        }
        guard let lastValue = stack.pop(), let result = Double(lastValue) else {
            return .failure
        }
        return .success(result)
    }
}
