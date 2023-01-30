//
//  Operator.swift
//  Calculator
//
//  Created by kokkilE on 2023/01/27.
//

enum Operator: Character, CaseIterable {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) throws -> Double {
        var calculatedValue: Double
        
        switch self {
        case .add:
            calculatedValue = self.add(lhs: lhs, rhs: rhs)
        case .subtract:
            calculatedValue = self.subtract(lhs: lhs, rhs: rhs)
        case .divide:
            do {
                calculatedValue = try self.divide(lhs: lhs, rhs: rhs)
            } catch { // MARK: catch 구문 수정 필요
                throw OperatorError.divideByZero
            }
        case .multiply:
            calculatedValue = self.multiply(lhs: lhs, rhs: rhs)
        }
        
        return calculatedValue
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func divide(lhs: Double, rhs: Double) throws -> Double {
        if rhs == 0.0 {
            throw OperatorError.divideByZero
        }
        
        return lhs / rhs
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}
