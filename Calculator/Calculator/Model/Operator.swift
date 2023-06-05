//
//  Operator.swift
//  Calculator
//
//  Created by Dasan on 2023/06/02.
//

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "−"
    case divide = "÷"
    case multiply = "×"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return self.add(lhs: lhs, rhs: rhs)
        case .subtract:
            return self.subtract(lhs: lhs, rhs: rhs)
        case .divide:
            return self.divide(lhs: lhs, rhs: rhs)
        case .multiply:
            return self.multiply(lhs: lhs, rhs: rhs)
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        let result = lhs + rhs
        return result
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        let result = lhs - rhs
        return result
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        guard lhs != 0.0 || rhs != 0.0 else {
            return 0.0
            // 에러처리
        }
        
        let result = lhs / rhs
        return result
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        let result = lhs * rhs
        return result
    }
}
