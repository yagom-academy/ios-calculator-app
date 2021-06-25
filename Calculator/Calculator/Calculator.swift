//
//  Calculator.swift
//  Calculator
//
//  Created by tae hoon park on 2021/06/25.
//

import Foundation

enum Operator: String, Equatable, Comparable {
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
    
    static func >= (lhs: Operator, rhs: Operator) -> Bool {
        lhs.priority >= rhs.priority
    }
}

enum OperatorPriority: Int {
    case low = 0
    case high = 1
}

enum CalculatorError: Error {
    case unknown
}

class Calculator {
    var infixArray: Array<Any> = [5.0, Operator.plus, 2.0, Operator.division, 7.0, Operator.multiplication, 3.0]
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
}

func main() {
    let c = Calculator()
    let a = c.converToPosifixNotation(of: c.infixArray)
    print(a)
    
}
