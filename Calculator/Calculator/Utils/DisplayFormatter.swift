//
//  DisplayFormatter.swift
//  Calculator
//
//  Created by Minsup on 2023/06/07.
//

import Foundation

class DisplayFormatter {
    
    static private let numberFormatter: NumberFormatter = {
        var numberFormatter = NumberFormatter()
        numberFormatter.roundingMode = .halfUp
        numberFormatter.groupingSeparator = ","
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        
        return numberFormatter
    }()
    
    static func string(from input: String) -> String {
        let components = input.split(with: ".")
        
        let integerPart = components[safe: 0] ?? ""
        let decimalPart = components[safe: 1] ?? ""
        
        let integer = self.numberFormatter.string(from: NSNumber(value: Double(integerPart) ?? .nan)) ?? ""        
        let decimal = decimalPart.isEmpty ? "" : "." + components[1]
        
        return integer + decimal
    }
    
    static func string(from input: Double) -> String {
        return self.numberFormatter.string(from: NSNumber(value: input)) ?? "error"
    }
    
    private init() { }
}
