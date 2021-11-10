//
//  CalculatorItem.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/09.
//

import Foundation

struct NumberItem: CalcultorItem {
    let data: Int
}

enum OperatorItem: CalcultorItem {
    case add
    case substract
    case multiple
    case divide
}

protocol CalcultorItem { }

extension NumberItem {
    var dataToString: String {
        return String(describing: self.data)
    }
}

extension OperatorItem {
    var operatorSymbol: String {
        switch self {
        case .add:
            return "+"
        case .substract:
            return "-"
        case .multiple:
            return "*"
        case .divide:
            return "/"
        }
    }
}
