//
//  Operator.swift
//  Calculator
//
//  Created by 이은찬 on 2022/05/17.
//
enum Operator: Character, CalculateItem {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case devide = "/"
}

extension Double: CalculateItem {
    
}
