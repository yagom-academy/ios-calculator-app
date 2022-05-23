//
//  OperatorItem.swift
//  Calculator
//
//  Created by 재재 on 2022/05/18.
//

import Foundation

enum OperatorItem: Character, CaseIterable, CalculateItem {
    case add
    case subtract
    case multiply
    case divide
    
    var symbol: String {
        switch self {
        case .add:
            return "+"
        case .subtract:
            return "-"
        case .multiply:
            return "*"
        case .divide:
            return "/"
        }
    }
