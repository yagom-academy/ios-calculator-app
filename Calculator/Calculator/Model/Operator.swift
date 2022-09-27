//
//  Operator.swift
//  Created by Wonbi
//

enum Operator: String, CalculateItem {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "×"
    case division = "÷"
    
    var identifier: String {
        self.rawValue
    }
}
