
import Foundation

enum Operator: Character, CaseIterable {
    case add = "+"
    case substract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return self.add(lhs: lhs, rhs: rhs)
        case .substract:
            return self.substract(lhs: lhs, rhs: rhs)
        case .divide:
            return self.divide(lhs: lhs, rhs: rhs)
        case .multiply:
            return self.multifly(lhs: lhs, rhs: rhs)
        }
        
    }
    
    private func add(lhs: Double, rhs: Double) -> Double { lhs + rhs }
    private func substract(lhs: Double, rhs: Double) -> Double { lhs - rhs }
    private func divide(lhs: Double, rhs: Double) -> Double {
        let isBothZero: Bool = (lhs == .zero && rhs == .zero)
        return isBothZero ? .nan : lhs/rhs
    }
    private func multifly(lhs: Double, rhs: Double) -> Double { lhs * rhs }
}


