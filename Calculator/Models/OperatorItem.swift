//
//  OperatorItem.swift
//  Calculator
//
//  Created by 재재 on 2022/05/18.
//

import Foundation

enum OperatorItem {
    case add
    case substract
    case multiple
    case devide
    
    var name: String {
        switch self {
        case .add:
            return "+"
        case .substract:
            return "-"
        case .multiple:
            return "*"
        case .devide:
            return "/"
        }
    }
}
