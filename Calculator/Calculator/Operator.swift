//  Created by Aejong on 2022/09/27

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+", subtract = "-", divide = "/", multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        return 0
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func substract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        return lhs / rhs
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
    
    func calculatee(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add :
            return add(lhs: lhs, rhs: rhs)
        case .subtract:
            return substract(lhs: lhs, rhs: rhs)
        case .divide:
            return divide(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        }
    }
}
