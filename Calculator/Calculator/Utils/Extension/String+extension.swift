//
//  String+extension.swift
//  Calculator
//
//  Created by Eddy on 2022/03/28.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return split(separator: target).map { String($0) }
    }
    
    var withoutComma: String {
        self.replacingOccurrences(of: CalculatorConstant.comma, with: CalculatorConstant.blank)
    }
}

extension String {
    func numberFomatter() -> String {
        let zero: NSNumber = 0
        
        guard self != "nan" else { return "NaN" }
        let noCommaText = self.withoutComma
        
        let numberFomatter = NumberFormatter()
        numberFomatter.numberStyle = .decimal
        numberFomatter.maximumFractionDigits = CalculatorConstant.maximumLength
        let number = numberFomatter.number(from: noCommaText) ?? zero
        
        let changedNumber = numberFomatter.string(from: number) ?? CalculatorConstant.blank
        return changedNumber
    }
}

extension Optional where Wrapped == String {
    var unwrapped: String {
        guard let result = self else { return CalculatorConstant.blank }
        return result
    }
}
