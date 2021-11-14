//
//  Operator.swift
//  Calculator
//
//  Created by 김진태 on 2021/11/14.
//

import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
}
