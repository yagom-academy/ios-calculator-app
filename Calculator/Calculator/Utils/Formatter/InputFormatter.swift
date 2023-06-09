//
//  DisplayFormatter.swift
//  Calculator
//
//  Created by Minsup on 2023/06/07.
//

import Foundation

enum InputFormatter {    
    static private let inputFormatter: NumberFormatter = {
        var numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = ","
        numberFormatter.numberStyle = .decimal
        return numberFormatter
    }()
    
    static func format(from input: String) -> String {
        let components = input.split(with: ".")
        
        let integerPart = components[safe: 0] ?? ""
        let decimalPart = components[safe: 1] ?? ""
        
        let integer = self.inputFormatter.string(from: NSNumber(value: Int(integerPart) ?? .zero)) ?? ""
        let decimal = decimalPart.isEmpty ? "" : "." + components[1]
        
        if input.contains(".") && decimalPart.isEmpty {
            return integer + "."
        } else {
            return integer + decimal
        }
    }    
}
