//
//  CalculatorItem.swift
//  Calculator
//
//  Created by 김태현 on 2022/03/14.
//

protocol CalculateItem {
    // empty
}

enum Operator: String, CalculateItem {
    case addition = "+"
    case subtraction = "-"
    case devision = "/"
    case multiplication = "*"
    case equalSign = "="
}

enum CalculatorItem: CalculateItem {
    case integer(Int)
    case double(Double)
    case `operator`(Operator)
    
    var value: String? {
        switch self {
        case .integer(let number):
            return String(number)
        case .double(let number):
            return String(number)
        case .operator(let sign):
            return sign.rawValue
        }
    }
}

extension CalculatorItem: Equatable {
    static func == (lhs: CalculatorItem, rhs: CalculatorItem) -> Bool {
        return lhs.value == rhs.value
    }
}
