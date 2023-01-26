//
//  Operator.swift
//  Calculator
//
//  Created by 송종환 on 2023/01/26.
//

import Foundation

enum Operator: Character, CaseIterable {
    case add = "+"
    case subtract = "-"
    case divide = "*"
    case muliply = "/"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        return 1 // =
    }
    
    func add(lhs: Double, rhs: Double) -> Double {
       return lhs + rhs
    }
    
    func subtract(lhs: Double, rhs: Double) -> Double {
       return lhs - rhs
    }
    
    func divide(lhs: Double, rhs: Double) -> Double {
       return lhs / rhs
    }
    
    func muliply(lhs: Double, rhs: Double) -> Double {
       return lhs * rhs
    }
}
