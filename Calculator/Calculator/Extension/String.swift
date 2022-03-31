//
//  String.swift
//  Calculator
//
//  Created by 조민호 on 2022/03/18.
//

import Foundation

extension String {
    var first: String {
        return self[self.startIndex].description
    }
    
    func split(with target: Character) -> [String] {
        return self.split(separator: target)
            .map { String($0) }
    }
    
    func toDecimal() -> String {
        let maximumSignificantDigits = 20
        let numberFormatter = Formatter.number
        let splitCurrentOperand = self.split(with: Character(Const.dot))
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = maximumSignificantDigits
        
        guard let integerOperand = splitCurrentOperand.first,
              let fractionOperand = splitCurrentOperand.last else {
            return self.description
        }
        
        guard let result = numberFormatter.string(for: Double(integerOperand)) else {
            return self.description
        }
        
        if self.contains(Const.dot) {
            return result + Const.dot + fractionOperand
        }
        
        return result
    }
}
