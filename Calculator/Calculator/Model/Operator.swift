//
//  Operator.swift
//  Calculator
//
//  Created by kimseongjun on 2023/01/27.
//

import Foundation

enum Operator: Character, CaseIterable {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) ->Double {
        
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .subtract:
            return add(lhs: lhs, rhs: rhs)
        case .divide:
            return add(lhs: lhs, rhs: rhs)
        case .multiply:
            return add(lhs: lhs, rhs: rhs)
        }
        return 0
    }
    
    func add(lhs: Double, rhs: Double) ->Double {
        return lhs + rhs
    }
    func subtract(lhs: Double, rhs: Double) ->Double {
        return lhs - rhs
    }
    func divide(lhs: Double, rhs: Double) ->Double {
        return lhs / rhs
    }
    func multiply(lhs: Double, rhs: Double) ->Double {
        return lhs * rhs
    }
}
