import UIKit

enum Operator: Character, CaseIterable, CalculateItem {
    case add
    case subtract
    case divide
    case multiply
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            add(lhs: lhs, rhs: rhs)
        case .subtract:
            subtract(lhs: lhs, rhs: rhs)
        case .divide:
            divide(lhs: lhs, rhs: rhs)
        case .multiply:
            multiply(lhs: lsh, rhs: rhs)
        }
    }
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    private func divide(lhs: Double, rhs: Double) -> Double {
        return lhs / rhs
    }
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}
