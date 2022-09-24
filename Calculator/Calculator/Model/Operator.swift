//  Operator.swift
//  Created by zhilly on 2022/09/24.

enum Operator: Character, CaseIterable {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
}

extension Operator: CalculateItem {
    
}
