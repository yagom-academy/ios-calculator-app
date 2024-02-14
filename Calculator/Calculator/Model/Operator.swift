//
//  Operator.swift
//  Calculator
//
//  Created by Danny on 2/11/24.
//

import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self.rawValue {
        case "+":
            return add(lhs: lhs, rhs: rhs)
        case "-":
            return subtract(lhs: lhs, rhs: rhs)
        case "/":
            do {
                let result = try divide(lhs: lhs, rhs: rhs)
                return result
            } catch CalculatorError.divideOfZero {
                print("0으로 나누면 에러가 발생합니다.")
                return 0
            } catch {
                print("그외 다른 Error가 발생했습니다.")
                return 0
            }
        default:
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
        if rhs == 0 {
            throw CalculatorError.divideOfZero
        }
        
        return lhs / rhs
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}
