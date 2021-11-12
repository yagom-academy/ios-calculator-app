//
//  Operator.swift.swift
//  Calculator
//
//  Created by Seul Mac on 2021/11/09.
//

import Foundation

enum Operator: CalculateItem {
    case add
    case subtract
    case multiply
    case divide
    
    var sign: String {
        switch self {
        case .add: return "+"
        case .subtract: return "_"
        case .multiply: return "×"
        case .divide: return "/"
        }
    }
}
