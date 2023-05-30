//
//  CalculateOperator.swift
//  Calculator
//
//  Created by Min Hyun on 2023/05/30.
//

enum OperatorType: String {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    
    var formula: (Double, Double) -> Double {
        switch self {
        case .add:
            return { $0 + $1 }
        case .subtract:
            return { $0 - $1 }
        case .multiply:
            return { $0 * $1 }
        case .divide:
            return { $0 / $1 }
        }
    }
}
