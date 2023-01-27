//
//  Operator.swift
//  Calculator
//
//  Created by 무리 on 2023/01/27.
//

enum Operator: Character, CaseIterable {
    case add = "+"
    case substract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate() {
        
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        let result = lhs + rhs
        
        return result
    }
    
    private func substract(lhs: Double, rhs: Double) -> Double {
        let result = lhs - rhs
        
        return result
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        let result = lhs / rhs
        
        return result
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        let result = lhs * rhs
        
        return result
    }
}
