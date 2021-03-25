//
//  Operators.swift
//  Calculator
//
//  Created by 천수현 on 2021/03/25.
//

import Foundation

struct Operator {
    let name: String
    let precedence: Int
}

enum Operators {
    static let addition = Operator(name: "+", precedence: 140)
    static let subtraction = Operator(name: "-", precedence: 140)
    static let multiplication = Operator(name: "*", precedence: 150)
    static let division = Operator(name: "/", precedence: 150)
}
