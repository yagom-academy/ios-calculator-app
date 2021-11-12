//
//  Operator.swift
//  Calculator
//
//  Created by Jun Bang on 2021/11/12.
//

import Foundation

enum Operator: Character, CaseIterable {
    case add = "+"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return lhs + rhs
        }
    }
}
