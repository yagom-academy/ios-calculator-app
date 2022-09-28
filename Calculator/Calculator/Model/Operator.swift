//
//  Operator.swift
//  Calculator
//

enum Operator: Character, CaseIterable {
    case add = "+"
    case substract = "-"
    case divide = "/"
    case multiply = "*"
    
    private func add(lhs: Double, rhs: Double) -> Double {
        
    }
    private func substract(lhs: Double, rhs: Double) -> Double {
        
    }
    private func divide(lhs: Double, rhs: Double) -> Double {
        
    }
    private func muliply(lhs: Double, rhs: Double) -> Double {
        
    }
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        
    }
}

extension Operator: CalculateItem {}
