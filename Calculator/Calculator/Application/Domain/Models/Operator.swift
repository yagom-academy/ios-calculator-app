//
//  Operator.swift
//  Calculator
//
//  Created by Gordon Choi on 2022/05/19.
//

enum Operator: Character, CalculateItem, CaseIterable {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
}
