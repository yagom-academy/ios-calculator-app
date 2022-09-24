//
//  Operator.swift
//  Calculator
//
//  Created by baem on 2022/09/24.
//

enum Operator: Character, CaseIterable {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculates(lhs: Double, rhs: Double) -> Double {
        return 1
    }
    
    func add(lhs: Double, rhs: Double) -> Double {
        return 1
    }
    
    func subtract(lhs: Double, rhs: Double) -> Double {
        return 1
    }
    
    func divide(lhs: Double, rhs: Double) -> Double {
        return 1
    }
    
    func multiply(lhs: Double, rhs: Double) -> Double {
        return 1
    }
}
