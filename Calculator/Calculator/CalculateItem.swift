//
//  CalculateItem.swift
//  Calculator
//
//  Created by 이시원 on 2022/03/18.
//

import Foundation

protocol CalculateItem {
    
}

extension Double: CalculateItem {
    
}

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
}
