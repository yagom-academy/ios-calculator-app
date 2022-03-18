import Foundation

enum Operator: Character, CaseIterable {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    public func calculate(lhs: Double, rhs: Double) throws -> Double {
        do {
            switch self {
            case .add:
                return add(lhs: lhs, rhs: rhs)
            case .subtract:
                return subtract(lhs: lhs, rhs: rhs)
            case .divide:
                return try divide(lhs: lhs, rhs: rhs)
            case .multiply:
                return multiply(lhs: lhs, rhs: rhs)
            }
        } catch _ as CalculatorError {
            return Double.nan
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func divide(lhs: Double, rhs: Double) throws -> Double {
        if rhs == Double.zero {
            throw CalculatorError.cannotDivideByZero
        }
        return lhs / rhs
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}
