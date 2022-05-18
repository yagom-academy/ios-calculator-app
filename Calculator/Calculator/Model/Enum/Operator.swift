//
//  Operator.swift
//  Calculator
//
//  Created by 김동용 on 2022/05/18.
//

enum Operator: Character, CaseIterable {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
    
    func add(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
    
    func subtract(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
    
    func divide(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
    
    func multiply(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
}
