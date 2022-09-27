//
//  CalculatorItems.swift
//  Calculator
//



extension Int: CalculateItem, Equatable {}
extension Double: CalculateItem {}
extension OperatorItem: CalculateItem {}

extension Equatable {
     {
        
    }
}


enum OperatorItem: Character, CaseIterable {
    case add = "+"
    case sub = "-"
    case mul = "*"
    case div = "/"
    case calculate = "="
}
