//
//  Operators.swift
//  Calculator
//
//  Created by 천수현 on 2021/03/25.
//


struct Operator {
    let name: String
    let precedence: Int
}

enum Operators {
    static var shared = Stack<Operator>()
    static let addition = Operator(name: "+", precedence: 140)
    static let subtraction = Operator(name: "-", precedence: 140)
    static let multiplication = Operator(name: "*", precedence: 150)
    static let division = Operator(name: "/", precedence: 150)
    static let AND = Operator(name: "&", precedence: 150)
    static let NAND = Operator(name: "~&", precedence: 150)
    static let OR = Operator(name: "|", precedence: 150)
    static let NOR = Operator(name: "~|", precedence: 150)
    static let XOR = Operator(name: "^", precedence: 150)
    static let NOT = Operator(name: "~", precedence: 150)
    static let shiftLeft = Operator(name: "<<", precedence: 150)
    static let shiftRight = Operator(name: ">>", precedence: 150)
    static let equal = Operator(name: "=", precedence: 90)
    
    func shouldPop(stack: Stack<Any>, topOfStack: Operator, currentOperator: Operator) -> Bool {
        if stack.isEmpty || currentOperator.precedence > topOfStack.precedence {
            return false
        } else {
            return true
        }
    }
}


