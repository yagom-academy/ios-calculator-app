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
        return lhs + rhs
    }
    private func substract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    private func divide(lhs: Double, rhs: Double) throws -> Double {
        if rhs == 0 {
            throw CalculatorError.divideByZero
        }
        
        return lhs / rhs
    }
    private func muliply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
    
    func calculate(lhs: Double, rhs: Double) throws -> Double {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .substract:
            return substract(lhs: lhs, rhs: rhs)
        case .divide:
            do {
                return try divide(lhs: lhs, rhs: rhs)
            } catch  {
                throw CalculatorError.divideByZero
            }
        case .multiply:
            return muliply(lhs: lhs, rhs: rhs)
        }
    }
}

extension Operator: CalculateItem {}
extension Operator: CustomStringConvertible {
    var description: String {
        return "\(self.rawValue)"
    }
}

