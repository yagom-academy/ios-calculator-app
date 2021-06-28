//
//  Operator.swift
//  Calculator
//
//  Created by JINHONG AN on 2021/06/23.
//

import Foundation

enum Operator: String {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    
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
    
    static func obtainOperator(from target: String) throws -> Operator {
        guard let operatorSymbol = Operator(rawValue: target) else {
            throw CalculatorError.invalidOperator
        }
        return operatorSymbol
    }
}
