//
//  String+Extension.swift
//  Calculator
//
//  Created by 노유빈 on 2022/10/06.
//

import Foundation

extension String {
    func convertNSNumber() -> NSNumber {
        let string = self.replacingOccurrences(of: MathSymbol.negative, with: MathSymbol.subtract)
        
        return (Double(string) ?? 0) as NSNumber
    }}