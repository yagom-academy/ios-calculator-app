//
//  FormManager.swift
//  Calculator
//
//  Created by mint, Whales on 2023/06/14.
//

import Foundation

struct FormManager {
    func transformResult(from input: String) -> String {
        var numberString = deleteComma(input)
        numberString = deleteLastDot(numberString)
        
        guard let number = Double(numberString),
              let output = formatter().string(from: number as NSNumber) else {
            return "NaN"
        }
        
        guard output != "-0" else {
            return "0"
        }
        
        return output
    }
    
    private func formatter() -> NumberFormatter {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        numberFormatter.maximumFractionDigits = 20
        
        return numberFormatter
    }
    
    private func deleteComma(_ input: String) -> String {
        return input.replacingOccurrences(of: ",", with: "")
    }
    
    private func deleteLastDot(_ input: String) -> String {
        guard input.hasSuffix(".") == false else {
            return input.replacingOccurrences(of: ".", with: "")
        }
        
        return input
    }
}
