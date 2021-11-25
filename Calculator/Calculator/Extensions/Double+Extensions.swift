//
//  Double+Extensions.swift
//  Calculator
//
//  Created by Jun Bang on 2021/11/15.
//

import Foundation

extension Double: CalculateItem {
    func presentableFormat() throws -> String? {
        let numberFormatter = NumberFormatGenerator.createNumberFormatter()
        guard let result = numberFormatter.string(from: NSNumber(value: self)) else {
            throw NumberFormatError.numberFormatFailed
        }
        
        return result
    }
    
    var convertToString: String {
        return String(self)
    }
}
