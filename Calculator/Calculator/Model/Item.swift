//
//  CalculatorItems.swift
//  Calculator
//

extension Int: CalculateItem {}
extension Double: CalculateItem {}
extension operatorItem: CalculateItem {}

enum operatorItem: Character {
    case add = "+"
    case sub = "-"
    case mul = "*"
    case div = "/"
    case eql = "="
}
