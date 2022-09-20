//
//  Operator.swift
//  Created by Wonbi on 2022/09/20.
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
