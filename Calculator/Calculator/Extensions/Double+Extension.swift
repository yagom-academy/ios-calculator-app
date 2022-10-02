//
//  Double+CalculateItem.swift
//  Calculator
//
//  Created by 노유빈 on 2022/09/21.
//

import Foundation

extension Double: CalculateItem { }

extension Double {
    func convertNSNumber() -> NSNumber {
        let string = self.replacingOccurrences(of: MathSymbol.negative, with: MathSymbol.minus)
        
        return (Double(string) ?? 0) as NSNumber
    }
}
