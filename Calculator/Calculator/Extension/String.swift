//
//  String.swift
//  Calculator
//
//  Created by 조민호 on 2022/03/18.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target)
            .map { String($0) }
    }
    
    func addCommaEveryThirdTime() -> String {
        let maximumSignificantDigits = 20
        let numberFormatter = NumberFormatter()
        let splitCurrentOperand = self.split(with: ".")
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        numberFormatter.maximumSignificantDigits = maximumSignificantDigits
        
        guard let integerOperand = splitCurrentOperand.first,
              let fractionOperand = splitCurrentOperand.last else {
            return self.description
        }
        
        guard let result = numberFormatter.string(for: Double(integerOperand)) else {
            return self.description
        }
        
        if self.contains(".") {
            return result + "." + fractionOperand
        }
        
        return result
    }
}
