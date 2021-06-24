//
//  Operators.swift
//  Calculator
//
//  Created by Nala on 2021/06/22.
//

import Foundation

enum Operators: String, Comparable {
    case plus = "+"
    case minus = "−"
    case multiply = "×"
    case divide = "÷"
    
    var operatorSymbol: String {
        self.rawValue
    }
    
    var priority: Int {
        switch self {
        case .plus, .minus:
            return 10
        case .multiply, .divide:
            return 100
        }
    }
    
    static func < (lhs: Operators, rhs: Operators) -> Bool {
        lhs.priority < rhs.priority
    }
    
    static func == (lhs: Operators, rhs: Operators) -> Bool {
        lhs.priority == rhs.priority
    }
}

