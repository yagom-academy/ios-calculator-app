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
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        var result: Double
        switch self {
        case .add:
            result = add(lhs: lhs, rhs: rhs)
            return result
        case .substract:
            result = substract(lhs: lhs, rhs: rhs)
            return result
        case .divide:
            result = divide(lhs: lhs, rhs: rhs)
            return result
        case .multiply:
            result = multiply(lhs: lhs, rhs: rhs)
            return result
        }
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
        if rhs == 0 {
            return .nan
        }
        let result = lhs/rhs
        
        return result
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        let result = lhs * rhs
        
        return result
    }
}
