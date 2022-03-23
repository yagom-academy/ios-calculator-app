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
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        numberFormatter.maximumSignificantDigits = 20
        
        guard let result = numberFormatter.string(for: Double(self)) else {
            return self.description
        }
        
        return result
    }
}
