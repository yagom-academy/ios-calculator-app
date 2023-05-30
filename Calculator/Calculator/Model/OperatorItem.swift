//
//  OperatorItem.swift
//  Calculator
//
//  Created by myungsun on 2023/05/30.
//

enum OperatorItem: CalculateItem, CustomStringConvertible {
    case add
    case subtract
    case multiply
    case divide
    
    var description: String {
        switch self {
        case .add:
            return "+"
        case .subtract:
            return "-"
        case .multiply:
            return "×"
        case .divide:
            return "÷"
        }
    }
}
