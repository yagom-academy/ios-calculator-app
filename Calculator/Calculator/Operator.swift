import Foundation

enum Operator: Character, CaseIterable {
    case add, subtract, divide, multiply
    
    public func calculate(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return 0.0
    }
}
