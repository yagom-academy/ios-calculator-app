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
        numberFormatter.maximumFractionDigits = 5
        return numberFormatter
    }()
    
    static func stringToInput(from input: String) -> String {
        let components = input.split(with: ".")
        
        let integerPart = components[safe: 0] ?? ""
        let decimalPart = components[safe: 1] ?? ""
        
        let integer = self.numberFormatter.string(from: NSNumber(value: Double(integerPart) ?? .zero)) ?? ""        
        let decimal = decimalPart.isEmpty ? "" : "." + components[1]
        
        if input.contains(".") && decimalPart.isEmpty {
            return integer + "."
        } else {
            return integer + decimal
        }
    }
    
    static func stringToResult(from input: Double) -> String {
        return self.numberFormatter.string(from: NSNumber(value: input)) ?? "error"
    }
    
    static func stringToResult(from input: String) -> String {
        guard let double = Double(input) else { return "0" }
        return self.numberFormatter.string(from: NSNumber(value: double)) ?? "error"
    }
    
    private init() { }
}
