//
//  Operator.swift
//  Calculator
//
//  Created by Kyo on 2022/09/22.
//

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "−"
    case divide = "÷"
    case multifly = "×"
    
    func calculator(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return self.add(lhs: lhs, rhs: rhs)
        case .subtract:
            return self.subtract(lhs: lhs, rhs: rhs)
        case .divide:
            return rhs == Double.zero ? .nan : self.divide(lhs: lhs, rhs: rhs)
        case .multifly:
            return self.multifly(lhs: lhs, rhs: rhs)
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
    
    private func multifly(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}
