//
//  CalculateItem.swift
//  Calculator
//
//  Created by 김동욱 on 2022/03/15.
//

import Foundation

protocol CalculateItem {}

enum Operator: Character, CaseIterable {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        return 0
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return 0
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return 0
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        return 0
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return 0
    }
    
}

extension Double: CalculateItem {}

extension String {
    func split(with target: Character) -> [String] {
        let convertStringArray = Array(arrayLiteral: target).map{ String($0) }
        return convertStringArray
    }
}
