//
//  Operator.swift
//  Calculator
//
//  Created by Eunsoo KIM on 2021/11/12.
//

import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
}
