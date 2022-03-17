//
//  Operators.swift
//  Calculator
//
//  Created by Marisol Mirim Kim on 2022/03/15.
//

import Foundation

enum Operators: CalculateItem {
    case plus
    case minus
    case multiplication
    case division
    case equalMark
}
extension Operators: CustomStringConvertible {
    var description: String {
        switch self {
        case .plus:
            return "+"
        case .minus:
            return "-"
        case .multiplication:
            return "*"
        case .division:
            return "/"
        case .equalMark:
            return "="
        }
    }
}
