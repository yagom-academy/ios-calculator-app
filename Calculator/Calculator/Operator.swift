//  Created by Victor on 2022/09/27

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+", subtract = "-", divide = "/", multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        return 0
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return 0
    }
    
    private func substract(lhs: Double, rhs: Double) -> Double {
        return 0
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        return 0
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return 0
    }
}
