//
//  Operator.swift
//  Calculator
//
//  Created by JINHONG AN on 2021/06/23.
//

import Foundation

enum Operator: String, OperatorConvertible {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    
    private static let lowPriority = 50
    private static let highPriority = 100
    
    private var priority: Int {
        switch self {
        case .add, .subtract:
            return Operator.lowPriority
        case .multiply, .divide:
            return Operator.highPriority
        }
    }
    
    func isHigherPriority(than anotherOperator: Operator) -> Bool {
        self.priority > anotherOperator.priority
    }
}
