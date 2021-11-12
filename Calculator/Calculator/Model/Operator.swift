//
//  Operator.swift
//  Calculator
//
//  Created by Jun Bang on 2021/11/12.
//

import Foundation

enum CalculationError: Error {
    case zeroDivision
}

enum Operator: Character, CaseIterable {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    
    func calculate(lhs: Double, rhs: Double) -> Double? {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .subtract:
            return subtract(lhs: lhs, rhs: rhs)
        case .divide:
            do {
                return try divide(lhs: lhs, rhs: rhs)
            } catch CalculationError.zeroDivision {
                print("0으로 나누면 안됩니다.")
            } catch {
                print("알 수 없는 오류가 발생했습니다.")
            }
            return nil
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
            throw CalculationError.zeroDivision
        }
        return lhs / rhs
    }
}
