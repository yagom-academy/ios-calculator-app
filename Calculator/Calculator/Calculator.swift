//
//  Calculator.swift
//  Calculator
//
//  Created by tae hoon park on 2021/06/25.
//

import Foundation

enum Operator: String, Comparable {
    case plus = "+"
    case minus = "-"
    case multiplication = "*"
    case division = "/"
    
    var priority: Int {
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

class Calculator {
    var infixArray: Array<Any> = []
    var stack = Stack<Any>()
    var postArray: Array<Any> = []
    
    func converToPosifixNotation(of originArray: Array<Any>) -> Array<Any> {
        for item in originArray {
            switch item {
            case _ as Double:
                postArray.append(item)
            case let someOperator as Operator:
                if stack.isEmpty {
                    stack.push(element: someOperator)
                    print(stack)
                } else {
                    guard let topOfStack = stack.top as? Operator else { return [1] }
                    
                    if topOfStack >= someOperator {
                        guard let topOfStack2 = stack.pop() as? Operator else { return [2] }
                        postArray.append(topOfStack2)
                        stack.push(element: someOperator)
                    } else {
                        stack.push(element: someOperator)
                    }
                }
            default: return [3]
            }
        }
        while stack.isEmpty == false {
            guard let topOfStack = stack.pop() else {
                return [5]
            }
            postArray.append(topOfStack)
        }
        return postArray
    }
    
    func checkOperator(_ input: String) throws -> Operator {
        guard let `operator` = Operator(rawValue: input) else {
            throw CalculatorError.unknown
        }
        return `operator`
    }
    
    func calculatePostfix() throws -> Double {
        for item in postArray {
            if let item = item as? Double {
                stack.push(element: item)
            } else {
                guard let firstElement = stack.pop(), let secondElement = stack.pop() else { return 0.0}
                guard let firstNumber = firstElement as? Double,
                      let secondNumber = secondElement as? Double else { return 0.0 }
//                do {
                    let `operator` = try? checkOperator(item as? String ?? "")
//                } catch {
//                    CalculatorError.unknown
//                }
                switch `operator` {
                case .plus:
                    stack.push(element: add(firstNumber, secondNumber))
                case .minus:
                    stack.push(element: substract(firstNumber, secondNumber))
                case .multiplication:
                    stack.push(element: multiply(firstNumber, secondNumber))
                case .division:
                    let result = try? divide(firstNumber, secondNumber)
                    stack.push(element: result as Any)
                default:
                    break
                }
            }
        }
        guard let lastElement = stack.pop(), let result = Double(lastElement as? Substring ?? "") else {
            throw CalculatorError.unknown
        }
        return result
    }
    
}

extension Calculator: Calculatable {
    func add(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber + secondNumber
    }
    
    func substract(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber - secondNumber
    }
    
    func multiply(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber * secondNumber
    }
    
    func divide(_ firstNumber: Double, _ secondNumber: Double) throws -> Double {
        if secondNumber == 0 {
            throw CalculatorError.dividedByZero
        }
        return firstNumber / secondNumber
    }
}

func main() {
    let c = Calculator()
    let a = c.converToPosifixNotation(of: [5.0, Operator.plus, 2.0, Operator.division, 7.0, Operator.multiplication, 3.0])
    print(a)
    
}
