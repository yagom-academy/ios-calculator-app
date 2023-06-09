//
//  ResultFormatter.swift
//  Calculator
//
//  Created by Minsup on 2023/06/09.
//

import Foundation

enum ResultFormatter {
    static private let resultFormatter: NumberFormatter = {
        var numberFormatter = NumberFormatter()
        numberFormatter.roundingMode = .halfUp
        numberFormatter.groupingSeparator = ","
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter
    }()
    
    static func format(from input: String) -> String {
        guard let double = Double(input) else { return "0" }
        return self.resultFormatter.string(from: NSNumber(value: double)) ?? "error"
    }
}
