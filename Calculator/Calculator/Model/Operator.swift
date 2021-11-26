
import Foundation


enum Operator: Character, CaseIterable {
    case add = "+"
    case subtract = "−"
    case divide = "÷"
    case multiply = "×"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .subtract:
            return subtract(lhs: lhs, rhs: rhs)
        case .divide:
            do {
                let result = try divide(lhs: lhs, rhs: rhs)
                return result
            } catch {
                return .nan
            }
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        }
    }
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    private func divide(lhs: Double, rhs: Double) throws -> Double {
        guard rhs != .zero else {
            throw CalculatorError.divideByZero
        }
        return lhs / rhs
    }
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}
