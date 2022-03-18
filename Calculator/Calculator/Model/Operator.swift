import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case multiply = "×"
    func calcuate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return lhs + rhs
        case .subtract:
            return lhs - rhs
        case .divide:
            return lhs / rhs
        case .multiply:
            return lhs * rhs
        }
    }
}
