//
//  Operator.swift
//  Calculator
//
//  Created by JINHONG AN on 2021/06/23.
//

import Foundation

enum Operator {
    case add, subtract, multiply, divide
    
    var priority: Int {
        switch self {
        case .add, .subtract:
            return 50
        case .multiply, .divide:
            return 100
        }
    }
    
    func isHigherPriority(than operator: Operator) -> Bool {
        return self.priority > `operator`.priority
    }
}
