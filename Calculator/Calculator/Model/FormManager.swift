//
//  FormManager.swift
//  Calculator
//
//  Created by mint, Whales on 2023/06/14.
//

import Foundation

enum FormManager {
    static let numberFormatter = NumberFormatter()
    
    static var configuredNumberFormatter : NumberFormatter {
        self.numberFormatter.numberStyle = .decimal
        self.numberFormatter.maximumFractionDigits = 19
        self.numberFormatter.maximumIntegerDigits = 20
        
        return self.numberFormatter
    }
    
    static func transformResult(from input: String) -> String {
        var numberString = deleteComma(input)
        numberString = deleteLastDot(numberString)
        
        guard let number = Double(numberString),
              let output = self.configuredNumberFormatter.string(from: number as NSNumber) else {
            return "NaN"
        }
        
        guard output != "-0" else {
            return "0"
        }
        
        return output
    }
    
    private static func deleteComma(_ input: String) -> String {
        return input.replacingOccurrences(of: ",", with: "")
    }
    
    private static func deleteLastDot(_ input: String) -> String {
        guard input.hasSuffix(".") == false else {
            return input.replacingOccurrences(of: ".", with: "")
        }
        
        return input
    }
}
