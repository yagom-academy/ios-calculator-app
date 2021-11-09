//
//  Operator.swift.swift
//  Calculator
//
//  Created by Seul Mac on 2021/11/09.
//

import Foundation

enum Operator {
    case add
    case subtract
    case multiply
    case divide
    
    var sign: String {
        switch self {
        case .add: return "+"
        case .subtract: return "-"
        case .multiply: return "×"
        case .divide: return "/"
        }
    }
}
