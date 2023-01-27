//
//  Operator.swift
//  Calculator
//
//  Created by kimseongjun on 2023/01/27.
//

import Foundation

enum Operator: Character, CaseIterable {
    case add = "+"
    case substract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) ->Double {
        return 0
    }
    
    func add(lhs: Double, rhs: Double) ->Double {
        return 0
    }
    func subtract(lhs: Double, rhs: Double) ->Double {
        return 0
    }
    func divide(lhs: Double, rhs: Double) ->Double {
        return 0
    }
    func multiply(lhs: Double, rhs: Double) ->Double {
        return 0
    }
}
