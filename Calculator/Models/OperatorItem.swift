//
//  OperatorItem.swift
//  Calculator
//
//  Created by 재재 on 2022/05/18.
//

import Foundation

enum OperatorItem {
    case add
    case subtract
    case multiply
    case devide
    
    var symbol: String {
        switch self {
        case .add:
            return "+"
        case .subtract:
            return "-"
        case .multiply:
            return "*"
        case .devide:
            return "/"
        }
    }
}
