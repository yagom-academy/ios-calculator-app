//
//  String+Extension.swift
//  Calculator
//
//  Created by 노유빈 on 2022/09/22.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
    
    func convertNSNumber() -> NSNumber {
        let string = self.replacingOccurrences(of: MathSymbol.negative, with: MathSymbol.minus)
        
        return (Double(string) ?? 0) as NSNumber
    }
}
