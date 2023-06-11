//
//  ExpressionFormatter.swift
//  Calculator
//
//  Created by Minsup on 2023/06/09.
//

import Foundation

enum ExpressionFormatter {
    static private let expressionFormatter: NumberFormatter = {
        var numberFormatter = NumberFormatter()
        numberFormatter.roundingMode = .halfUp
        numberFormatter.numberStyle = .decimal
        numberFormatter.usesGroupingSeparator = false
        
        return numberFormatter
    }()
    
    static func format(from input: Double) -> String {        
        switch input {
        case ...(-999_999_999_999_999):
            return "-999999999999999"
        case 999_999_999_999_999...:
            return "999999999999999"
        default:
            return self.expressionFormatter.string(from: NSNumber(value: input)) ?? ""
        }
    }
}
