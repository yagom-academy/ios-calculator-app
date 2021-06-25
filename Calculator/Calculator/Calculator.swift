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
    
    static func == (lhs: Operator, rhs: Operator) -> Bool {
        lhs.priority == rhs.priority
    }
}

enum OperatorPriority: Int {
    case low = 0
    case high = 1
}

class Calculator {
    var infixArray: Array<Any> = []
    var stack = Stack<Any>()
    var postArray: Array<Any> = []
    
    

}
