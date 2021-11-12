import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add: return Self.add(lhs: lhs, rhs: rhs)
        case .subtract: return Self.subtract(lhs: lhs, rhs: rhs)
        case .divide: return Self.divide(lhs: lhs, rhs: rhs)
        case .multiply: return Self.multiply(lhs: lhs, rhs: rhs)
        }
    }
    
    static private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    static private func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    static private func divide(lhs: Double, rhs: Double) -> Double {
        return lhs / rhs
    }
    static private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}
