//
//  Double+Extensions.swift
//  Calculator
//
//  Created by Jun Bang on 2021/11/15.
//

import Foundation

extension Double: CalculateItem {
    var presentableFormat: String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        
        guard let result = numberFormatter.string(from: NSNumber(value: self)) else {
            return nil
        }
        return result
    }
    
    var convertToString: String {
        return String(self)
    }
}
