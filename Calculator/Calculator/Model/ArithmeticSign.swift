//
//  ArithmeticSign.swift
//  Calculator
//
//  Created by Yongwoo Marco on 2021/06/25.
//

import Foundation

enum ArithmeticSign: Equatable {
    case number(Double)
    case addition
    case subtraction
    case mulitplication
    case division
    
    var priority: Int {
        switch self {
        case .addition:
            return 1
        case .subtraction:
            return 1
        case .mulitplication:
            return 2
        case .division:
            return 2
        default:
            return 0
        }
    }
    var extracted: Double {
        switch self {
        case .number(let value):
            return value
        default:
            return -1
        }
    }
    
    func computeNumber(_ lhs: Double, _ rhs: Double) -> Double {
        switch self {
        case .addition:
            return lhs + rhs
        case .subtraction:
            return lhs - rhs
        case .mulitplication:
            return lhs * rhs
        case .division:
            return lhs / rhs
        default:
            return -1
        }
    }
}

