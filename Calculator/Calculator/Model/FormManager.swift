//
//  FormManager.swift
//  Calculator
//
//  Created by mint, Whales on 2023/06/14.
//

import Foundation

enum FormManager {
    static let configuredNumberFormatter : NumberFormatter = {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 19
        numberFormatter.maximumIntegerDigits = 20
        
        return numberFormatter
    }()
    
    static func transformResult(from input: String) -> String {
        var numberString = deleteComma(input)
        numberString = deleteLastDot(numberString)
        
        guard let number = Double(numberString),
              let output = self.configuredNumberFormatter.string(from: number as NSNumber) else {
            return "NaN"
        }
        
        return output == "-0" ? "0" : output
    }
    
    private static func deleteComma(_ input: String) -> String {
        return input.replacingOccurrences(of: ",", with: "")
    }
    
    private static func deleteLastDot(_ input: String) -> String {
        guard input.hasSuffix(".") else {
            return input
        }
        
        return input.replacingOccurrences(of: ".", with: "")
    }
}
