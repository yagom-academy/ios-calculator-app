//
//  Operator.swift
//  Calculator
//
//  Created by Seoyeon Hong on 2023/01/31.
//

enum Operator: Character, CaseIterable {
    
    case add = "+"
    case substact = "-"
    case divide = "%"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs:Double) throws -> Double {
        switch self {
        case .add:
            return self.add(lhs: lhs, rhs: rhs)
        case .substact:
            return self.substract(lhs: lhs, rhs: rhs)
        case .divide:
            return try self.divide(lhs: lhs, rhs: rhs)
        case .multiply:
            return self.multiply(lhs: lhs, rhs: rhs)
        }
        
    }
    
    private func add(lhs: Double, rhs:Double) -> Double {
        return lhs + rhs
    }
    
    private func substract(lhs: Double, rhs:Double) -> Double {
        return lhs - rhs
    }
    
    private func divide(lhs: Double, rhs:Double) throws -> Double {
        if rhs == .zero {
            throw CalculatorError.devidedByZero
        }
        return lhs / rhs
    }
    
    private func multiply(lhs: Double, rhs:Double) -> Double {
        return lhs * rhs
    }
    
}

extension Operator: CalculateItem {}
