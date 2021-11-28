//
//  Operator.swift.swift
//  Calculator
//
//  Created by Seul Mac on 2021/11/09.
//

import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "−"
    case multiply = "×"
    case divide = "÷"
    
    init?(sign: Character) {
        self.init(rawValue: sign)
    }
    
    var operatorSign: Character {
        return self.rawValue
    }
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        let (decimalLhs, decimalRhs) = (Decimal(lhs), Decimal(rhs))
        
        switch self {
        case .add:
            return add(lhs: decimalLhs, rhs: decimalRhs)
        case .subtract:
            return subtract(lhs: decimalLhs, rhs: decimalRhs)
        case .multiply:
            return multiply(lhs: decimalLhs, rhs: decimalRhs)
        case .divide:
            return divide(lhs: decimalLhs, rhs: decimalRhs)
        }
    }
    
    private func add(lhs: Decimal, rhs: Decimal) -> Double {
        return Double(truncating: lhs + rhs as NSNumber)
    }
    
    private func subtract(lhs: Decimal, rhs: Decimal) -> Double {
        return Double(truncating: lhs - rhs as NSNumber)
    }
    
    private func multiply(lhs: Decimal, rhs: Decimal) -> Double {
        return Double(truncating: lhs * rhs as NSNumber)
    }
    
    private func divide(lhs: Decimal, rhs: Decimal) -> Double {
        return Double(truncating: lhs / rhs as NSNumber)
    }
    
}
