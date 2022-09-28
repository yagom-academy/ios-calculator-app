//
//  CalculatorItems.swift
//  Calculator
//
extension Int: CalculateItem {}
extension Double: CalculateItem {}
extension OperatorItem: CalculateItem {}

enum OperatorItem: Character, CaseIterable {
    case add = "+"
    case sub = "-"
    case mul = "*"
    case div = "/"
    case calculate = "="
}
