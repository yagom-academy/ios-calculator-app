//
//  CalculateItemProtocol.swift
//  Calculator
//
//  Created by 양호준 on 2021/11/11.
//

import Foundation

protocol CalculateItem {
    
}

extension Double: CalculateItem {
    
}

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "➕"
    case subtract = "➖"
    case divide = "➗"
    case multiply = "✖️"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self.rawValue {
        case "➕":
            return add(lhs: lhs, rhs: rhs)
        case "➖":
            return subtract(lhs: lhs, rhs: rhs)
        case "➗":
            return divide(lhs: lhs, rhs: rhs)
        case "✖️":
            return multiply(lhs: lhs, rhs: rhs)
        default:
            return 0
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

//extension String {
//    func split(with target: Character) -> [String] {
//        
//    }
//}


